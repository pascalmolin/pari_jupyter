cdef extern from "pari/pari.h" nogil:
    ctypedef unsigned long ulong "pari_ulong"
    ctypedef long* GEN
    ctypedef unsigned long pari_sp
    ctypedef long pari_timer

    ctypedef struct entree:
        entree* next
        char* name
        char* help

    long    paricfg_version_code
    long    PARI_VERSION_SHIFT

    pari_sp avma
    GEN     gnil

    int     INIT_JMPm, INIT_SIGm, INIT_DFTm, INIT_noPRIMEm, INIT_noIMTm
    void    pari_init_opts(size_t parisize, ulong maxprime, ulong init_opts)
    void    pari_init(size_t parisize, ulong maxprime)
    void    pari_sighandler(int sig)

    void    (*cb_pari_err_recover)(long)

    void    pari_free(void*)

    GEN     gp_read_str_multiline(char *t, char *last)
    char*   GENtostr(GEN x)
    void    pari_add_hist(GEN z, long t)
    long    pari_nb_hist()

    long    timer_delay(pari_timer *T)
    long    timer_get(pari_timer *T)
    void    timer_start(pari_timer *T)
    char*   gp_format_time(long delay)

    void    pari_puts(char*)
    void    pari_flush()

    struct PariOUT:
        void (*putch)(char)
        void (*puts)(const char*)
        void (*flush)()
    PariOUT* pariOut
    PariOUT* pariErr

    entree* is_entry(char *s)

cdef extern from "pari/paripriv.h" nogil:
    long    is_keyword_char(char c)

    ctypedef struct gp_data:
        int chrono
        pari_timer* T

    gp_data* GP_DATA

    ctypedef struct pari_rl_interface:
        pass

    void    pari_use_readline(pari_rl_interface)
    char**  pari_completion_matches(pari_rl_interface*, char* s, long pos, long* wordpos)
