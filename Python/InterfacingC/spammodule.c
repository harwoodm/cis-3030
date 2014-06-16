
#include "Python.h"

static PyObject *spam_system( PyObject *self, PyObject *args )
{
    const char *command;
          int   status;
          
    if( !PyArg_ParseTuple( args, "s", &command ) )
        return NULL;
    
    status = system( command );
    return Py_BuildValue( "i", status );
}


static PyMethodDef SpamMethods[] = {
    { "system", spam_system, METH_VARARGS, "Execute a shell command." },
    { NULL, NULL, 0, NULL }
};


PyMODINIT_FUNC initspam( void )
{
    ( void )Py_InitModule( "spam", SpamMethods );
}
