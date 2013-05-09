cdef extern from "cocos2d.h":
    ctypedef void            GLvoid
    ctypedef char            GLchar
    ctypedef unsigned int    GLenum
    ctypedef unsigned char   GLboolean
    ctypedef unsigned int    GLbitfield
    ctypedef signed char     GLbyte
    ctypedef short           GLshort
    ctypedef int             GLint
    ctypedef int             GLsizei
    ctypedef unsigned char   GLubyte
    ctypedef unsigned short  GLushort
    ctypedef unsigned int    GLuint
    ctypedef float           GLfloat
    ctypedef float           GLclampf
    ctypedef int             GLfixed
    ctypedef int             GLclampx

    #/* GL types for handling large vertex buffer objects */
    ctypedef long            GLintptr
    ctypedef long            GLsizeiptr

cdef extern from "cocos2d.h" namespace "cocos2d":
    ctypedef enum ccGLServerState:
        CC_GL_ALL

