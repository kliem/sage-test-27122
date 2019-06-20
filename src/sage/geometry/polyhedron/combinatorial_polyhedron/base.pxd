# distutils: language = c++
# distutils: extra_compile_args = "-march=native"
## distutils: sources = sage/geometry/polyhedron/combinatorial_polyhedron/bit_vector_operations.cc, sage/geometry/polyhedron/combinatorial_polyhedron/bit_vector_operations.h
cimport cython
from libc.stdint                cimport uint64_t
from sage.ext.memory_allocator  cimport MemoryAllocator
from sage.structure.sage_object cimport SageObject
from .face_iterator             cimport FaceIterator, CombinatorialFace
from .bit_vector_operations                cimport iter_struct
from .list_of_faces             cimport ListOfFaces
from .list_of_all_faces         cimport ListOfAllFaces

@cython.final
cdef class CombinatorialPolyhedron(SageObject):
    cdef tuple _V                       # the names of VRep, if they exist
    cdef dict _Vinv                     # dictionary to look up enumeration of vertices
    cdef tuple _H                       # the names of HRep, if they exist
    cdef tuple _equalities              # stores equalities, given on input (might belong to Hrep)
    cdef int _dimension                 # stores dimension, -2 on init
    cdef unsigned int _length_Hrep      # Hrep might include equalities
    cdef unsigned int _length_Vrepr      # Vrep might include rays/lines
    cdef size_t _n_facets               # length Hrep without equalities
    cdef bint _unbounded                # ``True`` iff Polyhedron is unbounded
    cdef int _n_lines                   # number of affinely independent lines in the Polyhedron
    cdef ListOfFaces bitrep_facets      # facets in bit representation
    cdef ListOfFaces bitrep_Vrepr       # vertices in bit representation
    cdef tuple _f_vector

    # Edges, ridges and incidences are stored in a pointer of pointers.
    # The first edge has vertices ``edges[0][0]`` and ``edges[0][1]``,
    # the second edge has vertices ``edges[0][2]`` and ``edges[0][3]``, etc.
    # There are ``_length_edges_list`` edges in ``edges[i]``, so the edge
    # ``_length_edges_list + 1`` has vertices ``edges[1][0]`` and ``edges[1][1]``.
    # Likewise for ridges and incidences.
    cdef size_t _length_edges_list


    cdef size_t **_edges                    # stores edges labeled by vertex indices
    cdef size_t _n_edges
    cdef size_t **_ridges                   # stores ridges labeld by facet indices
    cdef size_t _n_ridges
    cdef size_t **_face_lattice_incidences  # stores incidences in Hasse diagram labeled indices of the faces
    cdef size_t _n_face_lattice_incidences
    cdef ListOfAllFaces _all_faces          # class to generate Hasse diagram incidences

    # Space for edges, ridges, etc. is allocated with ``MemoryAllocators``.
    # Upon sucess they are copied to ``_mem_tuple``.
    # Thus deallocation (at the correct time) is taken care of.
    cdef tuple _mem_tuple

    cdef FaceIterator _face_iter(self, bint dual, int dimension)
    cdef int _compute_f_vector(self, size_t n_threads, size_t parallelization_depth) except -1
    cdef int _compute_edges(self, dual) except -1
    cdef int _compute_ridges(self, dual) except -1
    cdef int _compute_face_lattice_incidences(self) except -1
