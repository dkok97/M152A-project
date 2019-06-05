/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/152/M152A-project/state_machine.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static int ng3[] = {5, 0};
static int ng4[] = {2, 0};



static void Always_22_0(char *t0)
{
    char t18[8];
    char t19[8];
    char t25[8];
    char t29[8];
    char t37[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t26;
    char *t27;
    char *t28;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    int t61;
    int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    char *t75;
    char *t76;

LAB0:    t1 = (t0 + 3576U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(22, ng0);
    t2 = (t0 + 4144);
    *((int *)t2) = 1;
    t3 = (t0 + 3608);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(22, ng0);

LAB5:    xsi_set_current_line(23, ng0);
    t4 = (t0 + 2496);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t7, 32);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 32);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng4)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 32);
    if (t8 == 1)
        goto LAB11;

LAB12:
LAB14:
LAB13:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 472);
    t3 = *((char **)t2);
    t2 = (t0 + 2656);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 0LL);

LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(25, ng0);

LAB16:    xsi_set_current_line(26, ng0);
    t9 = (t0 + 1616U);
    t10 = *((char **)t9);
    t9 = (t10 + 4);
    t11 = *((unsigned int *)t9);
    t12 = (~(t11));
    t13 = *((unsigned int *)t10);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB17;

LAB18:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 2496);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2656);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 2, 0LL);

LAB19:    goto LAB15;

LAB9:    xsi_set_current_line(30, ng0);

LAB20:    xsi_set_current_line(31, ng0);
    t3 = (t0 + 1936U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng3)));
    memset(t18, 0, 8);
    t5 = (t4 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB22;

LAB21:    t7 = (t3 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB22;

LAB25:    if (*((unsigned int *)t4) < *((unsigned int *)t3))
        goto LAB23;

LAB24:    memset(t19, 0, 8);
    t10 = (t18 + 4);
    t11 = *((unsigned int *)t10);
    t12 = (~(t11));
    t13 = *((unsigned int *)t18);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t10) != 0)
        goto LAB28;

LAB29:    t17 = (t19 + 4);
    t20 = *((unsigned int *)t19);
    t21 = *((unsigned int *)t17);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB30;

LAB31:    memcpy(t37, t19, 8);

LAB32:    t69 = (t37 + 4);
    t70 = *((unsigned int *)t69);
    t71 = (~(t70));
    t72 = *((unsigned int *)t37);
    t73 = (t72 & t71);
    t74 = (t73 != 0);
    if (t74 > 0)
        goto LAB45;

LAB46:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 1936U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t18, 0, 8);
    t4 = (t3 + 4);
    if (*((unsigned int *)t4) != 0)
        goto LAB49;

LAB48:    t5 = (t2 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB49;

LAB52:    if (*((unsigned int *)t3) < *((unsigned int *)t2))
        goto LAB51;

LAB50:    *((unsigned int *)t18) = 1;

LAB51:    memset(t19, 0, 8);
    t9 = (t18 + 4);
    t11 = *((unsigned int *)t9);
    t12 = (~(t11));
    t13 = *((unsigned int *)t18);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB53;

LAB54:    if (*((unsigned int *)t9) != 0)
        goto LAB55;

LAB56:    t16 = (t19 + 4);
    t20 = *((unsigned int *)t19);
    t21 = (!(t20));
    t22 = *((unsigned int *)t16);
    t31 = (t21 || t22);
    if (t31 > 0)
        goto LAB57;

LAB58:    memcpy(t37, t19, 8);

LAB59:    t52 = (t37 + 4);
    t66 = *((unsigned int *)t52);
    t67 = (~(t66));
    t68 = *((unsigned int *)t37);
    t70 = (t68 & t67);
    t71 = (t70 != 0);
    if (t71 > 0)
        goto LAB72;

LAB73:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 2496);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2656);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 2, 0LL);

LAB74:
LAB47:    goto LAB15;

LAB11:    xsi_set_current_line(36, ng0);

LAB75:    xsi_set_current_line(37, ng0);
    t3 = (t0 + 1616U);
    t4 = *((char **)t3);
    t3 = (t4 + 4);
    t11 = *((unsigned int *)t3);
    t12 = (~(t11));
    t13 = *((unsigned int *)t4);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB76;

LAB77:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 2496);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2656);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 2, 0LL);

LAB78:    goto LAB15;

LAB17:    xsi_set_current_line(26, ng0);
    t16 = (t0 + 608);
    t17 = *((char **)t16);
    t16 = (t0 + 2656);
    xsi_vlogvar_wait_assign_value(t16, t17, 0, 0, 2, 0LL);
    goto LAB19;

LAB22:    t9 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB24;

LAB23:    *((unsigned int *)t18) = 1;
    goto LAB24;

LAB26:    *((unsigned int *)t19) = 1;
    goto LAB29;

LAB28:    t16 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB29;

LAB30:    t23 = (t0 + 2096U);
    t24 = *((char **)t23);
    t23 = ((char*)((ng3)));
    memset(t25, 0, 8);
    t26 = (t24 + 4);
    if (*((unsigned int *)t26) != 0)
        goto LAB34;

LAB33:    t27 = (t23 + 4);
    if (*((unsigned int *)t27) != 0)
        goto LAB34;

LAB37:    if (*((unsigned int *)t24) < *((unsigned int *)t23))
        goto LAB35;

LAB36:    memset(t29, 0, 8);
    t30 = (t25 + 4);
    t31 = *((unsigned int *)t30);
    t32 = (~(t31));
    t33 = *((unsigned int *)t25);
    t34 = (t33 & t32);
    t35 = (t34 & 1U);
    if (t35 != 0)
        goto LAB38;

LAB39:    if (*((unsigned int *)t30) != 0)
        goto LAB40;

LAB41:    t38 = *((unsigned int *)t19);
    t39 = *((unsigned int *)t29);
    t40 = (t38 & t39);
    *((unsigned int *)t37) = t40;
    t41 = (t19 + 4);
    t42 = (t29 + 4);
    t43 = (t37 + 4);
    t44 = *((unsigned int *)t41);
    t45 = *((unsigned int *)t42);
    t46 = (t44 | t45);
    *((unsigned int *)t43) = t46;
    t47 = *((unsigned int *)t43);
    t48 = (t47 != 0);
    if (t48 == 1)
        goto LAB42;

LAB43:
LAB44:    goto LAB32;

LAB34:    t28 = (t25 + 4);
    *((unsigned int *)t25) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB36;

LAB35:    *((unsigned int *)t25) = 1;
    goto LAB36;

LAB38:    *((unsigned int *)t29) = 1;
    goto LAB41;

LAB40:    t36 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t36) = 1;
    goto LAB41;

LAB42:    t49 = *((unsigned int *)t37);
    t50 = *((unsigned int *)t43);
    *((unsigned int *)t37) = (t49 | t50);
    t51 = (t19 + 4);
    t52 = (t29 + 4);
    t53 = *((unsigned int *)t19);
    t54 = (~(t53));
    t55 = *((unsigned int *)t51);
    t56 = (~(t55));
    t57 = *((unsigned int *)t29);
    t58 = (~(t57));
    t59 = *((unsigned int *)t52);
    t60 = (~(t59));
    t61 = (t54 & t56);
    t62 = (t58 & t60);
    t63 = (~(t61));
    t64 = (~(t62));
    t65 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t65 & t63);
    t66 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t66 & t64);
    t67 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t67 & t63);
    t68 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t68 & t64);
    goto LAB44;

LAB45:    xsi_set_current_line(31, ng0);
    t75 = (t0 + 608);
    t76 = *((char **)t75);
    t75 = (t0 + 2656);
    xsi_vlogvar_wait_assign_value(t75, t76, 0, 0, 2, 0LL);
    goto LAB47;

LAB49:    t7 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB51;

LAB53:    *((unsigned int *)t19) = 1;
    goto LAB56;

LAB55:    t10 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB56;

LAB57:    t17 = (t0 + 2096U);
    t23 = *((char **)t17);
    t17 = ((char*)((ng3)));
    memset(t25, 0, 8);
    t24 = (t23 + 4);
    if (*((unsigned int *)t24) != 0)
        goto LAB61;

LAB60:    t26 = (t17 + 4);
    if (*((unsigned int *)t26) != 0)
        goto LAB61;

LAB64:    if (*((unsigned int *)t23) < *((unsigned int *)t17))
        goto LAB63;

LAB62:    *((unsigned int *)t25) = 1;

LAB63:    memset(t29, 0, 8);
    t28 = (t25 + 4);
    t32 = *((unsigned int *)t28);
    t33 = (~(t32));
    t34 = *((unsigned int *)t25);
    t35 = (t34 & t33);
    t38 = (t35 & 1U);
    if (t38 != 0)
        goto LAB65;

LAB66:    if (*((unsigned int *)t28) != 0)
        goto LAB67;

LAB68:    t39 = *((unsigned int *)t19);
    t40 = *((unsigned int *)t29);
    t44 = (t39 | t40);
    *((unsigned int *)t37) = t44;
    t36 = (t19 + 4);
    t41 = (t29 + 4);
    t42 = (t37 + 4);
    t45 = *((unsigned int *)t36);
    t46 = *((unsigned int *)t41);
    t47 = (t45 | t46);
    *((unsigned int *)t42) = t47;
    t48 = *((unsigned int *)t42);
    t49 = (t48 != 0);
    if (t49 == 1)
        goto LAB69;

LAB70:
LAB71:    goto LAB59;

LAB61:    t27 = (t25 + 4);
    *((unsigned int *)t25) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB63;

LAB65:    *((unsigned int *)t29) = 1;
    goto LAB68;

LAB67:    t30 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB68;

LAB69:    t50 = *((unsigned int *)t37);
    t53 = *((unsigned int *)t42);
    *((unsigned int *)t37) = (t50 | t53);
    t43 = (t19 + 4);
    t51 = (t29 + 4);
    t54 = *((unsigned int *)t43);
    t55 = (~(t54));
    t56 = *((unsigned int *)t19);
    t8 = (t56 & t55);
    t57 = *((unsigned int *)t51);
    t58 = (~(t57));
    t59 = *((unsigned int *)t29);
    t61 = (t59 & t58);
    t60 = (~(t8));
    t63 = (~(t61));
    t64 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t64 & t60);
    t65 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t65 & t63);
    goto LAB71;

LAB72:    xsi_set_current_line(32, ng0);
    t69 = (t0 + 744);
    t75 = *((char **)t69);
    t69 = (t0 + 2656);
    xsi_vlogvar_wait_assign_value(t69, t75, 0, 0, 2, 0LL);
    goto LAB74;

LAB76:    xsi_set_current_line(37, ng0);
    t5 = (t0 + 472);
    t7 = *((char **)t5);
    t5 = (t0 + 2656);
    xsi_vlogvar_wait_assign_value(t5, t7, 0, 0, 2, 0LL);
    goto LAB78;

}

static void Always_45_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    t1 = (t0 + 3824U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 4160);
    *((int *)t2) = 1;
    t3 = (t0 + 3856);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(45, ng0);

LAB5:    xsi_set_current_line(46, ng0);
    t4 = (t0 + 2656);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 2496);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 2, 0LL);
    goto LAB2;

}


extern void work_m_00000000003902188424_0457016286_init()
{
	static char *pe[] = {(void *)Always_22_0,(void *)Always_45_1};
	xsi_register_didat("work_m_00000000003902188424_0457016286", "isim/fsm_tb_isim_beh.exe.sim/work/m_00000000003902188424_0457016286.didat");
	xsi_register_executes(pe);
}
