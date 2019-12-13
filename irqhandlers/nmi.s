@ NMI Handler
.thumb_func
_nmi_handler:
    push    {lr}


    pop     {pc}
bx lr
