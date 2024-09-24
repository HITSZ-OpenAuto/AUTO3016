# 自动控制实践A实验

![Static Badge](https://img.shields.io/badge/%E8%80%83%E6%9F%A5%E8%AF%BE-green)
![Static Badge](https://img.shields.io/badge/课程设计-green)
![Static Badge](https://img.shields.io/badge/%E5%AD%A6%E5%88%86（21级）-1-moccasin)
![Static Badge](https://img.shields.io/badge/%E5%AD%A6%E5%88%86（22级）-1.5-moccasin)

![Static Badge](https://img.shields.io/badge/%E6%88%90%E7%BB%A9%E6%9E%84%E6%88%90-gold)  ![Static Badge](https://img.shields.io/badge/实验报告-10%25*9=90%25-wheat)  ![Static Badge](https://img.shields.io/badge/答辩-10%25-wheat)

![Static Badge](https://img.shields.io/badge/总学时40-gold)   ![Static Badge](https://img.shields.io/badge/实验4学时*10-moccasin)

## 课程基本信息
- 课程信息见文件《实践A课程设计 PPT1.2  1110》。如要查看详细思路，请看 WJD_REPORT 文件夹下的答辩 ppt。
- 简单来说，就是制作一块有刷直流电机驱动板，包含 PWM 发生模块（用TL494）、功放（L298，没错，从大一用到现在的 L298）、编码器（测转速）、电流采集芯片（ACS712）。最后再用这块板子测试一些直流电机基本特性。这其中也训练一些焊接技能。

## 课程建议
- 这是本科期间与硬件最为相关的一门课程了，但是做出来的成品含金量只有大二甚至大一学生的水准。
- 去年（2023）叫课程设计，今年（2024）叫实验。从名字的更改也能看出，其实并没有什么设计的感觉，因为选型都是老师决定好的，所有的报告和答辩，其实都只是在帮老师阐释这个选型的合理性。
- 用的接线方式是在下发的 PCB 板上飞杜邦线。说是为了锻炼学生设计能力，实则一是完全不符合工程做法，二是完全没有设计感—— 安排得明明白白的模块，有什么设计思维可言？
- 但我还是要说，虽然选型没有要求，但对于电路结构、参数的设计还是有一些要求。对于从来没有接触过硬件设计的同学，这门课程姑且相当于入门。据我观察，有许多同学在设计 TL494 电路时，完全不会阅读手册，甚至很清晰的典型应用也没读明白，最后靠抄别人电路通过；不关注模块前后关系，输出的电平等级直接烧毁后级的 L298；测量电机机械特性时，转矩的数量级大多是错误的。从这点上说，还真的需要锻炼一下。
  - 但不要因为这门课而对从事硬件工程师工作产生不切实际的幻想。实际硬件设计需考虑的东西要复杂得多。
- 学长锐评：过家家，不如直接做 FOC。
- 我的锐评：是什么让学生过家家也过不清楚了？

> 文/ [Oliver Wu](https://www.github.com/OliverWu515)，2024.9
