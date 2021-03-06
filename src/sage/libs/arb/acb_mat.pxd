# distutils: depends = acb_mat.h

from sage.libs.arb.types cimport acb_t, acb_ptr, acb_srcptr, acb_mat_t, acb_poly_t, mag_t

# acb_mat.h
cdef extern from "arb_wrap.h":
    unsigned int acb_mat_nrows(acb_mat_t mat)
    unsigned int acb_mat_ncols(acb_mat_t mat)
    acb_t acb_mat_entry(acb_mat_t mat, unsigned long i, unsigned long j)
    void acb_mat_init(acb_mat_t mat, long r, long c)
    void acb_mat_clear(acb_mat_t mat)
    long acb_mat_allocated_bytes(const acb_mat_t x)
    void acb_mat_set(acb_mat_t dest, const acb_mat_t src)
    void acb_mat_printd(const acb_mat_t mat, long digits)
    bint acb_mat_equal(const acb_mat_t mat1, const acb_mat_t mat2)
    bint acb_mat_overlaps(const acb_mat_t mat1, const acb_mat_t mat2)
    bint acb_mat_contains(const acb_mat_t mat1, const acb_mat_t mat2)
    bint acb_mat_eq(const acb_mat_t mat1, const acb_mat_t mat2)
    bint acb_mat_ne(const acb_mat_t mat1, const acb_mat_t mat2)
    bint acb_mat_is_real(const acb_mat_t mat)
    bint acb_mat_is_empty(const acb_mat_t mat)
    bint acb_mat_is_square(const acb_mat_t mat)
    void acb_mat_zero(acb_mat_t mat)
    void acb_mat_one(acb_mat_t mat)
    void acb_mat_transpose(acb_mat_t dest, const acb_mat_t src)
    void acb_mat_frobenius_norm(acb_t res, const acb_mat_t A, long prec)
    void acb_mat_neg(acb_mat_t dest, const acb_mat_t src)
    void acb_mat_add(acb_mat_t res, const acb_mat_t mat1, const acb_mat_t mat2, long prec)
    void acb_mat_sub(acb_mat_t res, const acb_mat_t mat1, const acb_mat_t mat2, long prec)
    void acb_mat_mul(acb_mat_t res, const acb_mat_t mat1, const acb_mat_t mat2, long prec)
    void acb_mat_mul_classical(acb_mat_t res, const acb_mat_t mat1, const acb_mat_t mat2, long prec)
    void acb_mat_mul_threaded(acb_mat_t res, const acb_mat_t mat1, const acb_mat_t mat2, long prec)
    void acb_mat_mul_entrywise(acb_mat_t res, const acb_mat_t mat1, const acb_mat_t mat2, long prec)
    void acb_mat_sqr(acb_mat_t res, const acb_mat_t mat, long prec)
    void acb_mat_pow_ui(acb_mat_t res, const acb_mat_t mat, unsigned long exp, long prec)
    void acb_mat_scalar_mul_2exp_si(acb_mat_t B, const acb_mat_t A, long c)
    void acb_mat_scalar_addmul_si(acb_mat_t B, const acb_mat_t A, long c, long prec)
    void acb_mat_scalar_addmul_acb(acb_mat_t B, const acb_mat_t A, const acb_t c, long prec)
    void acb_mat_scalar_mul_si(acb_mat_t B, const acb_mat_t A, long c, long prec)
    void acb_mat_scalar_mul_acb(acb_mat_t B, const acb_mat_t A, const acb_t c, long prec)
    void acb_mat_scalar_div_si(acb_mat_t B, const acb_mat_t A, long c, long prec)
    void acb_mat_scalar_div_acb(acb_mat_t B, const acb_mat_t A, const acb_t c, long prec)
    bint acb_mat_lu(long * perm, acb_mat_t LU, const acb_mat_t A, long prec)
    void acb_mat_solve_lu_precomp(acb_mat_t X, const long * perm, const acb_mat_t LU, const acb_mat_t B, long prec)
    bint acb_mat_solve(acb_mat_t X, const acb_mat_t A, const acb_mat_t B, long prec)
    bint acb_mat_inv(acb_mat_t X, const acb_mat_t A, long prec)
    void acb_mat_det(acb_t det, const acb_mat_t A, long prec)
    void acb_mat_charpoly(acb_poly_t cp, const acb_mat_t mat, long prec)
    void acb_mat_exp_taylor_sum(acb_mat_t S, const acb_mat_t A, long N, long prec)
    void acb_mat_exp(acb_mat_t B, const acb_mat_t A, long prec)
    void acb_mat_trace(acb_t trace, const acb_mat_t mat, long prec)
    void acb_mat_get_mid(acb_mat_t B, const acb_mat_t A)
    void acb_mat_add_error_mag(acb_mat_t mat, const mag_t err)
    int acb_mat_approx_eig_qr(acb_ptr E, acb_mat_t L, acb_mat_t R, const acb_mat_t A, const mag_t tol, long maxiter, long prec)
    void acb_mat_eig_global_enclosure(mag_t eps, const acb_mat_t A, acb_srcptr E, const acb_mat_t R, long prec)
    void acb_mat_eig_enclosure_rump(acb_t lam, acb_mat_t J, acb_mat_t R, const acb_mat_t A, const acb_t lambda_approx, const acb_mat_t R_approx, long prec)
    int acb_mat_eig_simple_rump(acb_ptr E, acb_mat_t L, acb_mat_t R, const acb_mat_t A, acb_srcptr E_approx, const acb_mat_t R_approx, long prec)
    int acb_mat_eig_simple_vdhoeven_mourrain(acb_ptr E, acb_mat_t L, acb_mat_t R, const acb_mat_t A, acb_srcptr E_approx, const acb_mat_t R_approx, long prec)
    int acb_mat_eig_simple(acb_ptr E, acb_mat_t L, acb_mat_t R, const acb_mat_t A, acb_srcptr E_approx, const acb_mat_t R_approx, long prec)
    int acb_mat_eig_multiple_rump(acb_ptr E, const acb_mat_t A, acb_srcptr E_approx, const acb_mat_t R_approx, long prec)
    int acb_mat_eig_multiple(acb_ptr E, const acb_mat_t A, acb_srcptr E_approx, const acb_mat_t R_approx, long prec)
