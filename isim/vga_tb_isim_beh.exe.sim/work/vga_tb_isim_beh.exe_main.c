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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_02610362154575129740_0096331732_init();
    work_m_02610362154575129740_2629088878_init();
    work_m_11413120341791068359_1023033545_init();
    work_m_07066316069655861270_2178944355_init();
    work_m_02206912030265773780_0749069297_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_02206912030265773780_0749069297");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}
