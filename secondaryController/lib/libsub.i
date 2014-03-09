 %module libsub
 %{
 /* Includes the header in the wrapper code */
 #include "libsub.h"
 %}
 
 /* Parse the header file to generate wrappers */
 %include "libsub.h"
 
