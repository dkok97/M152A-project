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
static const char *ng0 = "C:/Users/152/Desktop/working_game_nt/M152A-project/update_joy2.v";
static int ng1[] = {1, 0};
static int ng2[] = {0, 0};
static int ng3[] = {150, 0};
static int ng4[] = {20, 0};
static int ng5[] = {400, 0};
static int ng6[] = {10, 0};
static int ng7[] = {850, 0};
static int ng8[] = {2, 0};
static int ng9[] = {600, 0};



static void Always_43_0(char *t0)
{
    char t6[8];
    char t30[8];
    char t34[8];
    char t50[8];
    char t58[8];
    char t101[8];
    char t112[8];
    char t126[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    char *t62;
    char *t63;
    char *t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    int t82;
    int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    char *t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    char *t96;
    char *t97;
    char *t98;
    char *t99;
    char *t100;
    char *t102;
    char *t103;
    char *t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    char *t110;
    char *t111;
    char *t113;
    char *t114;
    char *t115;
    char *t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    char *t122;
    char *t123;
    char *t124;
    char *t125;
    char *t127;

LAB0:    t1 = (t0 + 4688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 5008);
    *((int *)t2) = 1;
    t3 = (t0 + 4720);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(44, ng0);

LAB5:    xsi_set_current_line(45, ng0);
    t4 = (t0 + 2568U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t4 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t4);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB9;

LAB6:    if (t18 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t6) = 1;

LAB9:    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(50, ng0);

LAB14:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 2728U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB18;

LAB15:    if (t18 != 0)
        goto LAB17;

LAB16:    *((unsigned int *)t6) = 1;

LAB18:    memset(t30, 0, 8);
    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB19;

LAB20:    if (*((unsigned int *)t8) != 0)
        goto LAB21;

LAB22:    t22 = (t30 + 4);
    t31 = *((unsigned int *)t30);
    t32 = *((unsigned int *)t22);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB23;

LAB24:    memcpy(t58, t30, 8);

LAB25:    t90 = (t58 + 4);
    t91 = *((unsigned int *)t90);
    t92 = (~(t91));
    t93 = *((unsigned int *)t58);
    t94 = (t93 & t92);
    t95 = (t94 != 0);
    if (t95 > 0)
        goto LAB37;

LAB38:
LAB39:
LAB12:    goto LAB2;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(46, ng0);

LAB13:    xsi_set_current_line(47, ng0);
    t28 = (t0 + 1016);
    t29 = *((char **)t28);
    t28 = (t0 + 3608);
    xsi_vlogvar_wait_assign_value(t28, t29, 0, 0, 10, 0LL);
    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1152);
    t3 = *((char **)t2);
    t2 = (t0 + 3768);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 10, 0LL);
    goto LAB12;

LAB17:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB18;

LAB19:    *((unsigned int *)t30) = 1;
    goto LAB22;

LAB21:    t21 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB22;

LAB23:    t28 = (t0 + 2888U);
    t29 = *((char **)t28);
    t28 = ((char*)((ng1)));
    memset(t34, 0, 8);
    t35 = (t29 + 4);
    t36 = (t28 + 4);
    t37 = *((unsigned int *)t29);
    t38 = *((unsigned int *)t28);
    t39 = (t37 ^ t38);
    t40 = *((unsigned int *)t35);
    t41 = *((unsigned int *)t36);
    t42 = (t40 ^ t41);
    t43 = (t39 | t42);
    t44 = *((unsigned int *)t35);
    t45 = *((unsigned int *)t36);
    t46 = (t44 | t45);
    t47 = (~(t46));
    t48 = (t43 & t47);
    if (t48 != 0)
        goto LAB29;

LAB26:    if (t46 != 0)
        goto LAB28;

LAB27:    *((unsigned int *)t34) = 1;

LAB29:    memset(t50, 0, 8);
    t51 = (t34 + 4);
    t52 = *((unsigned int *)t51);
    t53 = (~(t52));
    t54 = *((unsigned int *)t34);
    t55 = (t54 & t53);
    t56 = (t55 & 1U);
    if (t56 != 0)
        goto LAB30;

LAB31:    if (*((unsigned int *)t51) != 0)
        goto LAB32;

LAB33:    t59 = *((unsigned int *)t30);
    t60 = *((unsigned int *)t50);
    t61 = (t59 & t60);
    *((unsigned int *)t58) = t61;
    t62 = (t30 + 4);
    t63 = (t50 + 4);
    t64 = (t58 + 4);
    t65 = *((unsigned int *)t62);
    t66 = *((unsigned int *)t63);
    t67 = (t65 | t66);
    *((unsigned int *)t64) = t67;
    t68 = *((unsigned int *)t64);
    t69 = (t68 != 0);
    if (t69 == 1)
        goto LAB34;

LAB35:
LAB36:    goto LAB25;

LAB28:    t49 = (t34 + 4);
    *((unsigned int *)t34) = 1;
    *((unsigned int *)t49) = 1;
    goto LAB29;

LAB30:    *((unsigned int *)t50) = 1;
    goto LAB33;

LAB32:    t57 = (t50 + 4);
    *((unsigned int *)t50) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB33;

LAB34:    t70 = *((unsigned int *)t58);
    t71 = *((unsigned int *)t64);
    *((unsigned int *)t58) = (t70 | t71);
    t72 = (t30 + 4);
    t73 = (t50 + 4);
    t74 = *((unsigned int *)t30);
    t75 = (~(t74));
    t76 = *((unsigned int *)t72);
    t77 = (~(t76));
    t78 = *((unsigned int *)t50);
    t79 = (~(t78));
    t80 = *((unsigned int *)t73);
    t81 = (~(t80));
    t82 = (t75 & t77);
    t83 = (t79 & t81);
    t84 = (~(t82));
    t85 = (~(t83));
    t86 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t86 & t84);
    t87 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t87 & t85);
    t88 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t88 & t84);
    t89 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t89 & t85);
    goto LAB36;

LAB37:    xsi_set_current_line(51, ng0);

LAB40:    xsi_set_current_line(52, ng0);
    t96 = (t0 + 3608);
    t97 = (t96 + 56U);
    t98 = *((char **)t97);
    t99 = (t0 + 1424);
    t100 = *((char **)t99);
    memset(t101, 0, 8);
    t99 = (t98 + 4);
    if (*((unsigned int *)t99) != 0)
        goto LAB42;

LAB41:    t102 = (t100 + 4);
    if (*((unsigned int *)t102) != 0)
        goto LAB42;

LAB45:    if (*((unsigned int *)t98) < *((unsigned int *)t100))
        goto LAB43;

LAB44:    t104 = (t101 + 4);
    t105 = *((unsigned int *)t104);
    t106 = (~(t105));
    t107 = *((unsigned int *)t101);
    t108 = (t107 & t106);
    t109 = (t108 != 0);
    if (t109 > 0)
        goto LAB46;

LAB47:
LAB48:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 3608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1288);
    t7 = *((char **)t5);
    memset(t6, 0, 8);
    t5 = (t4 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB67;

LAB66:    t8 = (t7 + 4);
    if (*((unsigned int *)t8) != 0)
        goto LAB67;

LAB70:    if (*((unsigned int *)t4) > *((unsigned int *)t7))
        goto LAB68;

LAB69:    t22 = (t6 + 4);
    t9 = *((unsigned int *)t22);
    t10 = (~(t9));
    t11 = *((unsigned int *)t6);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB71;

LAB72:
LAB73:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 3768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1560);
    t7 = *((char **)t5);
    memset(t6, 0, 8);
    t5 = (t4 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB130;

LAB129:    t8 = (t7 + 4);
    if (*((unsigned int *)t8) != 0)
        goto LAB130;

LAB133:    if (*((unsigned int *)t4) > *((unsigned int *)t7))
        goto LAB131;

LAB132:    t22 = (t6 + 4);
    t9 = *((unsigned int *)t22);
    t10 = (~(t9));
    t11 = *((unsigned int *)t6);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB134;

LAB135:
LAB136:    xsi_set_current_line(71, ng0);
    t2 = (t0 + 3768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1696);
    t7 = *((char **)t5);
    memset(t6, 0, 8);
    t5 = (t4 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB155;

LAB154:    t8 = (t7 + 4);
    if (*((unsigned int *)t8) != 0)
        goto LAB155;

LAB158:    if (*((unsigned int *)t4) < *((unsigned int *)t7))
        goto LAB156;

LAB157:    t22 = (t6 + 4);
    t9 = *((unsigned int *)t22);
    t10 = (~(t9));
    t11 = *((unsigned int *)t6);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB159;

LAB160:
LAB161:    goto LAB39;

LAB42:    t103 = (t101 + 4);
    *((unsigned int *)t101) = 1;
    *((unsigned int *)t103) = 1;
    goto LAB44;

LAB43:    *((unsigned int *)t101) = 1;
    goto LAB44;

LAB46:    xsi_set_current_line(53, ng0);

LAB49:    xsi_set_current_line(54, ng0);
    t110 = (t0 + 3048U);
    t111 = *((char **)t110);
    t110 = ((char*)((ng3)));
    memset(t112, 0, 8);
    t113 = (t111 + 4);
    if (*((unsigned int *)t113) != 0)
        goto LAB51;

LAB50:    t114 = (t110 + 4);
    if (*((unsigned int *)t114) != 0)
        goto LAB51;

LAB54:    if (*((unsigned int *)t111) < *((unsigned int *)t110))
        goto LAB52;

LAB53:    t116 = (t112 + 4);
    t117 = *((unsigned int *)t116);
    t118 = (~(t117));
    t119 = *((unsigned int *)t112);
    t120 = (t119 & t118);
    t121 = (t120 != 0);
    if (t121 > 0)
        goto LAB55;

LAB56:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 3048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng5)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    if (*((unsigned int *)t4) != 0)
        goto LAB59;

LAB58:    t5 = (t2 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB59;

LAB62:    if (*((unsigned int *)t3) < *((unsigned int *)t2))
        goto LAB60;

LAB61:    t8 = (t6 + 4);
    t9 = *((unsigned int *)t8);
    t10 = (~(t9));
    t11 = *((unsigned int *)t6);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB63;

LAB64:
LAB65:
LAB57:    goto LAB48;

LAB51:    t115 = (t112 + 4);
    *((unsigned int *)t112) = 1;
    *((unsigned int *)t115) = 1;
    goto LAB53;

LAB52:    *((unsigned int *)t112) = 1;
    goto LAB53;

LAB55:    xsi_set_current_line(54, ng0);
    t122 = (t0 + 3608);
    t123 = (t122 + 56U);
    t124 = *((char **)t123);
    t125 = ((char*)((ng4)));
    memset(t126, 0, 8);
    xsi_vlog_unsigned_add(t126, 32, t124, 10, t125, 32);
    t127 = (t0 + 3608);
    xsi_vlogvar_wait_assign_value(t127, t126, 0, 0, 10, 0LL);
    goto LAB57;

LAB59:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB61;

LAB60:    *((unsigned int *)t6) = 1;
    goto LAB61;

LAB63:    xsi_set_current_line(55, ng0);
    t21 = (t0 + 3608);
    t22 = (t21 + 56U);
    t28 = *((char **)t22);
    t29 = ((char*)((ng6)));
    memset(t30, 0, 8);
    xsi_vlog_unsigned_add(t30, 32, t28, 10, t29, 32);
    t35 = (t0 + 3608);
    xsi_vlogvar_wait_assign_value(t35, t30, 0, 0, 10, 0LL);
    goto LAB65;

LAB67:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB69;

LAB68:    *((unsigned int *)t6) = 1;
    goto LAB69;

LAB71:    xsi_set_current_line(59, ng0);

LAB74:    xsi_set_current_line(60, ng0);
    t28 = (t0 + 3048U);
    t29 = *((char **)t28);
    t28 = ((char*)((ng7)));
    memset(t30, 0, 8);
    t35 = (t29 + 4);
    if (*((unsigned int *)t35) != 0)
        goto LAB76;

LAB75:    t36 = (t28 + 4);
    if (*((unsigned int *)t36) != 0)
        goto LAB76;

LAB79:    if (*((unsigned int *)t29) > *((unsigned int *)t28))
        goto LAB77;

LAB78:    memset(t34, 0, 8);
    t51 = (t30 + 4);
    t14 = *((unsigned int *)t51);
    t15 = (~(t14));
    t16 = *((unsigned int *)t30);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB80;

LAB81:    if (*((unsigned int *)t51) != 0)
        goto LAB82;

LAB83:    t62 = (t34 + 4);
    t19 = *((unsigned int *)t34);
    t20 = *((unsigned int *)t62);
    t23 = (t19 || t20);
    if (t23 > 0)
        goto LAB84;

LAB85:    memcpy(t101, t34, 8);

LAB86:    t111 = (t101 + 4);
    t67 = *((unsigned int *)t111);
    t68 = (~(t67));
    t69 = *((unsigned int *)t101);
    t70 = (t69 & t68);
    t71 = (t70 != 0);
    if (t71 > 0)
        goto LAB99;

LAB100:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 3048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng9)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    if (*((unsigned int *)t4) != 0)
        goto LAB103;

LAB102:    t5 = (t2 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB103;

LAB106:    if (*((unsigned int *)t3) > *((unsigned int *)t2))
        goto LAB104;

LAB105:    memset(t30, 0, 8);
    t8 = (t6 + 4);
    t9 = *((unsigned int *)t8);
    t10 = (~(t9));
    t11 = *((unsigned int *)t6);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB107;

LAB108:    if (*((unsigned int *)t8) != 0)
        goto LAB109;

LAB110:    t22 = (t30 + 4);
    t14 = *((unsigned int *)t30);
    t15 = *((unsigned int *)t22);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB111;

LAB112:    memcpy(t58, t30, 8);

LAB113:    t97 = (t58 + 4);
    t59 = *((unsigned int *)t97);
    t60 = (~(t59));
    t61 = *((unsigned int *)t58);
    t65 = (t61 & t60);
    t66 = (t65 != 0);
    if (t66 > 0)
        goto LAB126;

LAB127:
LAB128:
LAB101:    goto LAB73;

LAB76:    t49 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t49) = 1;
    goto LAB78;

LAB77:    *((unsigned int *)t30) = 1;
    goto LAB78;

LAB80:    *((unsigned int *)t34) = 1;
    goto LAB83;

LAB82:    t57 = (t34 + 4);
    *((unsigned int *)t34) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB83;

LAB84:    t63 = (t0 + 3608);
    t64 = (t63 + 56U);
    t72 = *((char **)t64);
    t73 = ((char*)((ng8)));
    memset(t50, 0, 8);
    t90 = (t72 + 4);
    if (*((unsigned int *)t90) != 0)
        goto LAB88;

LAB87:    t96 = (t73 + 4);
    if (*((unsigned int *)t96) != 0)
        goto LAB88;

LAB91:    if (*((unsigned int *)t72) > *((unsigned int *)t73))
        goto LAB89;

LAB90:    memset(t58, 0, 8);
    t98 = (t50 + 4);
    t24 = *((unsigned int *)t98);
    t25 = (~(t24));
    t26 = *((unsigned int *)t50);
    t27 = (t26 & t25);
    t31 = (t27 & 1U);
    if (t31 != 0)
        goto LAB92;

LAB93:    if (*((unsigned int *)t98) != 0)
        goto LAB94;

LAB95:    t32 = *((unsigned int *)t34);
    t33 = *((unsigned int *)t58);
    t37 = (t32 & t33);
    *((unsigned int *)t101) = t37;
    t100 = (t34 + 4);
    t102 = (t58 + 4);
    t103 = (t101 + 4);
    t38 = *((unsigned int *)t100);
    t39 = *((unsigned int *)t102);
    t40 = (t38 | t39);
    *((unsigned int *)t103) = t40;
    t41 = *((unsigned int *)t103);
    t42 = (t41 != 0);
    if (t42 == 1)
        goto LAB96;

LAB97:
LAB98:    goto LAB86;

LAB88:    t97 = (t50 + 4);
    *((unsigned int *)t50) = 1;
    *((unsigned int *)t97) = 1;
    goto LAB90;

LAB89:    *((unsigned int *)t50) = 1;
    goto LAB90;

LAB92:    *((unsigned int *)t58) = 1;
    goto LAB95;

LAB94:    t99 = (t58 + 4);
    *((unsigned int *)t58) = 1;
    *((unsigned int *)t99) = 1;
    goto LAB95;

LAB96:    t43 = *((unsigned int *)t101);
    t44 = *((unsigned int *)t103);
    *((unsigned int *)t101) = (t43 | t44);
    t104 = (t34 + 4);
    t110 = (t58 + 4);
    t45 = *((unsigned int *)t34);
    t46 = (~(t45));
    t47 = *((unsigned int *)t104);
    t48 = (~(t47));
    t52 = *((unsigned int *)t58);
    t53 = (~(t52));
    t54 = *((unsigned int *)t110);
    t55 = (~(t54));
    t82 = (t46 & t48);
    t83 = (t53 & t55);
    t56 = (~(t82));
    t59 = (~(t83));
    t60 = *((unsigned int *)t103);
    *((unsigned int *)t103) = (t60 & t56);
    t61 = *((unsigned int *)t103);
    *((unsigned int *)t103) = (t61 & t59);
    t65 = *((unsigned int *)t101);
    *((unsigned int *)t101) = (t65 & t56);
    t66 = *((unsigned int *)t101);
    *((unsigned int *)t101) = (t66 & t59);
    goto LAB98;

LAB99:    xsi_set_current_line(60, ng0);
    t113 = (t0 + 3608);
    t114 = (t113 + 56U);
    t115 = *((char **)t114);
    t116 = ((char*)((ng4)));
    memset(t112, 0, 8);
    xsi_vlog_unsigned_minus(t112, 32, t115, 10, t116, 32);
    t122 = (t0 + 3608);
    xsi_vlogvar_wait_assign_value(t122, t112, 0, 0, 10, 0LL);
    goto LAB101;

LAB103:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB105;

LAB104:    *((unsigned int *)t6) = 1;
    goto LAB105;

LAB107:    *((unsigned int *)t30) = 1;
    goto LAB110;

LAB109:    t21 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB110;

LAB111:    t28 = (t0 + 3608);
    t29 = (t28 + 56U);
    t35 = *((char **)t29);
    t36 = ((char*)((ng1)));
    memset(t34, 0, 8);
    t49 = (t35 + 4);
    if (*((unsigned int *)t49) != 0)
        goto LAB115;

LAB114:    t51 = (t36 + 4);
    if (*((unsigned int *)t51) != 0)
        goto LAB115;

LAB118:    if (*((unsigned int *)t35) > *((unsigned int *)t36))
        goto LAB116;

LAB117:    memset(t50, 0, 8);
    t62 = (t34 + 4);
    t17 = *((unsigned int *)t62);
    t18 = (~(t17));
    t19 = *((unsigned int *)t34);
    t20 = (t19 & t18);
    t23 = (t20 & 1U);
    if (t23 != 0)
        goto LAB119;

LAB120:    if (*((unsigned int *)t62) != 0)
        goto LAB121;

LAB122:    t24 = *((unsigned int *)t30);
    t25 = *((unsigned int *)t50);
    t26 = (t24 & t25);
    *((unsigned int *)t58) = t26;
    t64 = (t30 + 4);
    t72 = (t50 + 4);
    t73 = (t58 + 4);
    t27 = *((unsigned int *)t64);
    t31 = *((unsigned int *)t72);
    t32 = (t27 | t31);
    *((unsigned int *)t73) = t32;
    t33 = *((unsigned int *)t73);
    t37 = (t33 != 0);
    if (t37 == 1)
        goto LAB123;

LAB124:
LAB125:    goto LAB113;

LAB115:    t57 = (t34 + 4);
    *((unsigned int *)t34) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB117;

LAB116:    *((unsigned int *)t34) = 1;
    goto LAB117;

LAB119:    *((unsigned int *)t50) = 1;
    goto LAB122;

LAB121:    t63 = (t50 + 4);
    *((unsigned int *)t50) = 1;
    *((unsigned int *)t63) = 1;
    goto LAB122;

LAB123:    t38 = *((unsigned int *)t58);
    t39 = *((unsigned int *)t73);
    *((unsigned int *)t58) = (t38 | t39);
    t90 = (t30 + 4);
    t96 = (t50 + 4);
    t40 = *((unsigned int *)t30);
    t41 = (~(t40));
    t42 = *((unsigned int *)t90);
    t43 = (~(t42));
    t44 = *((unsigned int *)t50);
    t45 = (~(t44));
    t46 = *((unsigned int *)t96);
    t47 = (~(t46));
    t82 = (t41 & t43);
    t83 = (t45 & t47);
    t48 = (~(t82));
    t52 = (~(t83));
    t53 = *((unsigned int *)t73);
    *((unsigned int *)t73) = (t53 & t48);
    t54 = *((unsigned int *)t73);
    *((unsigned int *)t73) = (t54 & t52);
    t55 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t55 & t48);
    t56 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t56 & t52);
    goto LAB125;

LAB126:    xsi_set_current_line(61, ng0);
    t98 = (t0 + 3608);
    t99 = (t98 + 56U);
    t100 = *((char **)t99);
    t102 = ((char*)((ng6)));
    memset(t101, 0, 8);
    xsi_vlog_unsigned_minus(t101, 32, t100, 10, t102, 32);
    t103 = (t0 + 3608);
    xsi_vlogvar_wait_assign_value(t103, t101, 0, 0, 10, 0LL);
    goto LAB128;

LAB130:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB132;

LAB131:    *((unsigned int *)t6) = 1;
    goto LAB132;

LAB134:    xsi_set_current_line(66, ng0);

LAB137:    xsi_set_current_line(67, ng0);
    t28 = (t0 + 3208U);
    t29 = *((char **)t28);
    t28 = ((char*)((ng3)));
    memset(t30, 0, 8);
    t35 = (t29 + 4);
    if (*((unsigned int *)t35) != 0)
        goto LAB139;

LAB138:    t36 = (t28 + 4);
    if (*((unsigned int *)t36) != 0)
        goto LAB139;

LAB142:    if (*((unsigned int *)t29) < *((unsigned int *)t28))
        goto LAB140;

LAB141:    t51 = (t30 + 4);
    t14 = *((unsigned int *)t51);
    t15 = (~(t14));
    t16 = *((unsigned int *)t30);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB143;

LAB144:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 3208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng5)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    if (*((unsigned int *)t4) != 0)
        goto LAB147;

LAB146:    t5 = (t2 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB147;

LAB150:    if (*((unsigned int *)t3) < *((unsigned int *)t2))
        goto LAB148;

LAB149:    t8 = (t6 + 4);
    t9 = *((unsigned int *)t8);
    t10 = (~(t9));
    t11 = *((unsigned int *)t6);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB151;

LAB152:
LAB153:
LAB145:    goto LAB136;

LAB139:    t49 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t49) = 1;
    goto LAB141;

LAB140:    *((unsigned int *)t30) = 1;
    goto LAB141;

LAB143:    xsi_set_current_line(67, ng0);
    t57 = (t0 + 3768);
    t62 = (t57 + 56U);
    t63 = *((char **)t62);
    t64 = ((char*)((ng4)));
    memset(t34, 0, 8);
    xsi_vlog_unsigned_minus(t34, 32, t63, 10, t64, 32);
    t72 = (t0 + 3768);
    xsi_vlogvar_wait_assign_value(t72, t34, 0, 0, 10, 0LL);
    goto LAB145;

LAB147:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB149;

LAB148:    *((unsigned int *)t6) = 1;
    goto LAB149;

LAB151:    xsi_set_current_line(68, ng0);
    t21 = (t0 + 3768);
    t22 = (t21 + 56U);
    t28 = *((char **)t22);
    t29 = ((char*)((ng6)));
    memset(t30, 0, 8);
    xsi_vlog_unsigned_minus(t30, 32, t28, 10, t29, 32);
    t35 = (t0 + 3768);
    xsi_vlogvar_wait_assign_value(t35, t30, 0, 0, 10, 0LL);
    goto LAB153;

LAB155:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB157;

LAB156:    *((unsigned int *)t6) = 1;
    goto LAB157;

LAB159:    xsi_set_current_line(72, ng0);

LAB162:    xsi_set_current_line(73, ng0);
    t28 = (t0 + 3208U);
    t29 = *((char **)t28);
    t28 = ((char*)((ng7)));
    memset(t30, 0, 8);
    t35 = (t29 + 4);
    if (*((unsigned int *)t35) != 0)
        goto LAB164;

LAB163:    t36 = (t28 + 4);
    if (*((unsigned int *)t36) != 0)
        goto LAB164;

LAB167:    if (*((unsigned int *)t29) > *((unsigned int *)t28))
        goto LAB165;

LAB166:    t51 = (t30 + 4);
    t14 = *((unsigned int *)t51);
    t15 = (~(t14));
    t16 = *((unsigned int *)t30);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB168;

LAB169:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 3208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng9)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    if (*((unsigned int *)t4) != 0)
        goto LAB172;

LAB171:    t5 = (t2 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB172;

LAB175:    if (*((unsigned int *)t3) > *((unsigned int *)t2))
        goto LAB173;

LAB174:    t8 = (t6 + 4);
    t9 = *((unsigned int *)t8);
    t10 = (~(t9));
    t11 = *((unsigned int *)t6);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB176;

LAB177:
LAB178:
LAB170:    goto LAB161;

LAB164:    t49 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t49) = 1;
    goto LAB166;

LAB165:    *((unsigned int *)t30) = 1;
    goto LAB166;

LAB168:    xsi_set_current_line(73, ng0);
    t57 = (t0 + 3768);
    t62 = (t57 + 56U);
    t63 = *((char **)t62);
    t64 = ((char*)((ng4)));
    memset(t34, 0, 8);
    xsi_vlog_unsigned_add(t34, 32, t63, 10, t64, 32);
    t72 = (t0 + 3768);
    xsi_vlogvar_wait_assign_value(t72, t34, 0, 0, 10, 0LL);
    goto LAB170;

LAB172:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB174;

LAB173:    *((unsigned int *)t6) = 1;
    goto LAB174;

LAB176:    xsi_set_current_line(74, ng0);
    t21 = (t0 + 3768);
    t22 = (t21 + 56U);
    t28 = *((char **)t22);
    t29 = ((char*)((ng6)));
    memset(t30, 0, 8);
    xsi_vlog_unsigned_add(t30, 32, t28, 10, t29, 32);
    t35 = (t0 + 3768);
    xsi_vlogvar_wait_assign_value(t35, t30, 0, 0, 10, 0LL);
    goto LAB178;

}


extern void work_m_00000000002660428940_2629088878_init()
{
	static char *pe[] = {(void *)Always_43_0};
	xsi_register_didat("work_m_00000000002660428940_2629088878", "isim/vga_tb2_isim_beh.exe.sim/work/m_00000000002660428940_2629088878.didat");
	xsi_register_executes(pe);
}
