""" Example of wrapping a C function that takes C double arrays as input using
    the Numpy declarations from Cython """

# import both numpy and the Cython declarations for numpy
import numpy as np
cimport numpy as np

# if you want to use the Numpy-C-API from Cython
# (not strictly necessary for this example)
np.import_array()

# cdefine the signature of our c function
cdef extern from "cec14_test_func.h":
 void cec14_test_func(
  double * in_array, double * out_array, int nx,int mx, int func_num)

# create the wrapper code, with numpy type annotations
def value(
 np.ndarray[double, ndim=2, mode="c"] x not None,
 int func_num
 ):
 nx = x.shape[1]
 mx = x.shape[0]
 f = np.empty(mx,dtype=float)

 cec14_test_func(
  <double*> np.PyArray_DATA(x),
  <double*> np.PyArray_DATA(f),
  nx,
  mx,
  func_num
  )

 return f


