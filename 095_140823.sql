SELECT A.CD, B.QCODENM,
A.ASENERGE,
A.ASWATER ,
A.ASANMPTN,
A.ASFAT   ,
A.ASCALBDT,
A.ASFIBER ,
A.ASLIME  ,
A.ASCALCIM,
A.ASIN    ,
A.ASSTEEL ,
A.ASZINC  ,
A.ASMGNTSM,
A.ASNATRIM,
A.ASKALIUM,
A.ASVTAMA2,
A.ASVTAMA3,
A.ASVTAMA4,
A.ASBTAMD ,
A.ASBTAME ,
A.ASVTANC ,
A.ASVTAMB1,
A.ASVTAMB2,
A.ASNAIASN,
A.ASBTAMB6,
A.ASHYDACD,
A.ASBTAM12,
A.ASGABBRT,
A.ASCOLEST,
A.ASTOTFAT,
A.ASSATFAT,
A.ASUNIFAT,
A.ASMULFAT,
A.ASBTAMA5,
A.ASBTAMA6,
A.ASLYCOPN,
A.ASLUTEIN,
A.ASALCOHL
  FROM (
select
                   qty_sel.cd,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASENERGE) / count(*) ASENERGE,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASWATER ) / count(*) ASWATER ,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASANMPTN) / count(*) ASANMPTN,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASFAT   ) / count(*) ASFAT   ,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASCALBDT) / count(*) ASCALBDT,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASFIBER ) / count(*) ASFIBER ,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASLIME  ) / count(*) ASLIME  ,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASCALCIM) / count(*) ASCALCIM,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASIN    ) / count(*) ASIN    ,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASSTEEL ) / count(*) ASSTEEL ,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASZINC  ) / count(*) ASZINC  ,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASMGNTSM) / count(*) ASMGNTSM,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASNATRIM) / count(*) ASNATRIM,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASKALIUM) / count(*) ASKALIUM,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASVTAMA2) / count(*) ASVTAMA2,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASVTAMA3) / count(*) ASVTAMA3,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASVTAMA4) / count(*) ASVTAMA4,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASBTAMD ) / count(*) ASBTAMD ,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASBTAME ) / count(*) ASBTAME ,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASVTANC ) / count(*) ASVTANC ,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASVTAMB1) / count(*) ASVTAMB1,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASVTAMB2) / count(*) ASVTAMB2,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASNAIASN) / count(*) ASNAIASN,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASBTAMB6) / count(*) ASBTAMB6,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASHYDACD) / count(*) ASHYDACD,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASBTAM12) / count(*) ASBTAM12,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASGABBRT) / count(*) ASGABBRT,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASCOLEST) / count(*) ASCOLEST,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASTOTFAT) / count(*) ASTOTFAT,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASSATFAT) / count(*) ASSATFAT,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASUNIFAT) / count(*) ASUNIFAT,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASMULFAT) / count(*) ASMULFAT,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASBTAMA5) / count(*) ASBTAMA5,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASBTAMA6) / count(*) ASBTAMA6,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASLYCOPN) / count(*) ASLYCOPN,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASLUTEIN) / count(*) ASLUTEIN,
                   SUM(qty_sel.qty*bin_sel.bin*food_sel.ASALCOHL) / count(*) ASALCOHL
                   --SUM(qty_sel.qty*bin_sel.bin*food_sel.ASFIBER ) / count(*) ASFIBER
              from (select /*+ INDEX(a SMQUESAT_PK) INDEX (b SMQUESMT_PK) */
                           a.QCODE1 cd ,
                           b.FOODBASEQTY qty
                      from SMQUESAT a,SMQUESMT b
                     where a.PATNO   = '&IsPatno'
                       and a.ORDDATE = to_date(&ItOrddate,'YYYYMMDD')
                  /*   and a.QPKG    = 'FOOD' 20090729 */
                       and a.QPKG  in ('FOOD','FXXD')
                       and (a.QCODE1 like 'QC%'
                        or  a.QCODE1 in ('QD01','QD02','QD03','QH01','QH02','QH03','QH19'))
                       and a.ACODE2 = b.QCODE
                       and ROWNUM < 10000
                   union select 'QC11',1 from dual  ) qty_sel,
                   (select /*+ INDEX(a SMQUESAT_PK) INDEX (b SMQUESMT_PK) */
                           a.QCODE1 cd,
                           b.FOODBASEQTY - to_number(decode(substr(a.QCODE1,1,2),
                                        'QD',sel.bin,'0')) bin
                      from SMQUESAT a,SMQUESMT b,
                       (select /*+ INDEX(a SMQUESAT_PK) INDEX (b SMQUESMT_PK) */
                                   substr(a.QCODE1,1,1)||'D'||substr(a.QCODE1,3,2) cd,
                                   b.FOODBASEQTY bin
                              from SMQUESAT a, SMQUESMT b
                             where a.PATNO = '&IsPatno'
                               and a.ORDDATE = to_date(&ItOrddate,'YYYYMMDD')
                          /*   and a.QPKG    = 'FOOD' 20090729 */
                               and a.QPKG  in ('FOOD','FXXD')
                               and a.QCODE1 in ('QH01','QH02','QH03')
                               and a.ACODE1 = b.QCODE) sel
                     where a.PATNO = '&IsPatno'
                       and a.ORDDATE = to_date(&ItOrddate,'YYYYMMDD')
                  /*   and a.QPKG    = 'FOOD' 20090729 */
                       and a.QPKG  in ('FOOD','FXXD')
                       and (a.QCODE1 like 'QC%'
                        or  a.QCODE1 in ('QD01','QD02','QD03','QH01','QH02','QH03','QH19'))
                       and a.ACODE1 = b.QCODE
                       and sel.cd(+) = a.QCODE1
                       and ROWNUM < 10000) bin_sel  ,
                   (select /*+ INDEX(a SMQUESAT_PK) INDEX(c SUSMCFDT_PK) INDEX (b SMQUESMT_PK) */
                           a.QCODE1 cd,
                           sum(c.ENERGY    *(b.FOODBASEQTY/100)) / count(*) ASENERGE,
                           sum(c.WATER     *(b.FOODBASEQTY/100)) / count(*) ASWATER ,
                           sum(c.PROTEIN   *(b.FOODBASEQTY/100)) / count(*) ASANMPTN,
                           sum(c.FAT       *(b.FOODBASEQTY/100)) / count(*) ASFAT   ,
                           sum(c.CALBDT    *(b.FOODBASEQTY/100)) / count(*) ASCALBDT,
                           sum(c.CELOSE    *(b.FOODBASEQTY/100)) / count(*) ASCELOSE,
                           sum(c.LIME      *(b.FOODBASEQTY/100)) / count(*) ASLIME  ,
                           sum(c.CALCIUM   *(b.FOODBASEQTY/100)) / count(*) ASCALCIM,
                           sum(c.INN       *(b.FOODBASEQTY/100)) / count(*) ASIN    ,
                           sum(c.FE        *(b.FOODBASEQTY/100)) / count(*) ASSTEEL ,
                           sum(c.ZINC      *(b.FOODBASEQTY/100)) / count(*) ASZINC  ,
                           sum(c.MAGNE     *(b.FOODBASEQTY/100)) / count(*) ASMGNTSM,
                           sum(c.NATRIUM   *(b.FOODBASEQTY/100)) / count(*) ASNATRIM,
                           sum(c.KALLIUM   *(b.FOODBASEQTY/100)) / count(*) ASKALIUM,
                           sum(c.VITAMINA1 *(b.FOODBASEQTY/100)) / count(*) ASVTAMA2,
                           sum(c.VITAMINA2 *(b.FOODBASEQTY/100)) / count(*) ASVTAMA3,
                           sum(c.VITAMINA3 *(b.FOODBASEQTY/100)) / count(*) ASVTAMA4,
                           sum(c.VITAMIND  *(b.FOODBASEQTY/100)) / count(*) ASBTAMD ,
                           sum(c.VITAMINE  *(b.FOODBASEQTY/100)) / count(*) ASBTAME ,
                           sum(c.VITAMINC  *(b.FOODBASEQTY/100)) / count(*) ASVTANC ,
                           sum(c.VITAMINB1 *(b.FOODBASEQTY/100)) / count(*) ASVTAMB1,
                           sum(c.VITAMINB2 *(b.FOODBASEQTY/100)) / count(*) ASVTAMB2,
                           sum(c.NAIASIN   *(b.FOODBASEQTY/100)) / count(*) ASNAIASN,
                           sum(c.VITAMINB6 *(b.FOODBASEQTY/100)) / count(*) ASBTAMB6,
                           sum(c.HYDACD    *(b.FOODBASEQTY/100)) / count(*) ASHYDACD,
                           sum(c.VITAMINB12*(b.FOODBASEQTY/100)) / count(*) ASBTAM12,
                           sum(c.ABORATE   *(b.FOODBASEQTY/100)) / count(*) ASGABBRT,
                           sum(c.COLEST    *(b.FOODBASEQTY/100)) / count(*) ASCOLEST,
                           sum(c.TOTFAT    *(b.FOODBASEQTY/100)) / count(*) ASTOTFAT,
                           sum(c.SATFAT    *(b.FOODBASEQTY/100)) / count(*) ASSATFAT,
                           sum(c.UNIFAT    *(b.FOODBASEQTY/100)) / count(*) ASUNIFAT,
                           sum(c.MULFAT    *(b.FOODBASEQTY/100)) / count(*) ASMULFAT,
                           sum(c.AKALO     *(b.FOODBASEQTY/100)) / count(*) ASBTAMA5,
                           sum(c.PROAKA    *(b.FOODBASEQTY/100)) / count(*) ASBTAMA6,
                           sum(c.LYCOPN    *(b.FOODBASEQTY/100)) / count(*) ASLYCOPN,
                           sum(c.LUTEIN    *(b.FOODBASEQTY/100)) / count(*) ASLUTEIN,
                           sum(c.ALCHOL    *(b.FOODBASEQTY/100)) / count(*) ASALCOHL,
                           sum(c.FIBER     *(b.FOODBASEQTY/100)) / count(*) ASFIBER
                      from SMQUESAT a,SUSMCFDT c,SMQUESMT b
                     where a.PATNO = '&IsPatno'
                       and a.ORDDATE = to_date(&ItOrddate,'YYYYMMDD')
                  /*   and a.QPKG    = 'FOOD' 20090729 */
                       and a.QPKG  in ('FOOD','FXXD')
                       and a.QCODE1 like 'QC%'
                       and a.ACODE3   = b.QCODE
                       and c.OPERTYP  = 'A'
                       and b.FOODCODE = c.SMCFCODE
                     group by a.QCODE1
                     union all
                    select /*+ INDEX(a SMQUESAT_PK) INDEX(c SUSMCFDT_PK) INDEX (b SMQUESMT_PK) INDEX(d SMQUESAT_PK)*/
                           d.QCODE1 cd,
                           sum(c.ENERGY    *(b.FOODBASEQTY/100)) / count(*) ASENERGE,
                           sum(c.WATER     *(b.FOODBASEQTY/100)) / count(*) ASWATER ,
                           sum(c.PROTEIN   *(b.FOODBASEQTY/100)) / count(*) ASANMPTN,
                           sum(c.FAT       *(b.FOODBASEQTY/100)) / count(*) ASFAT   ,
                           sum(c.CALBDT    *(b.FOODBASEQTY/100)) / count(*) ASCALBDT,
                           sum(c.CELOSE    *(b.FOODBASEQTY/100)) / count(*) ASCELOSE,
                           sum(c.LIME      *(b.FOODBASEQTY/100)) / count(*) ASLIME  ,
                           sum(c.CALCIUM   *(b.FOODBASEQTY/100)) / count(*) ASCALCIM,
                           sum(c.INN       *(b.FOODBASEQTY/100)) / count(*) ASIN    ,
                           sum(c.FE        *(b.FOODBASEQTY/100)) / count(*) ASSTEEL ,
                           sum(c.ZINC      *(b.FOODBASEQTY/100)) / count(*) ASZINC  ,
                           sum(c.MAGNE     *(b.FOODBASEQTY/100)) / count(*) ASMGNTSM,
                           sum(c.NATRIUM   *(b.FOODBASEQTY/100)) / count(*) ASNATRIM,
                           sum(c.KALLIUM   *(b.FOODBASEQTY/100)) / count(*) ASKALIUM,
                           sum(c.VITAMINA1 *(b.FOODBASEQTY/100)) / count(*) ASVTAMA2,
                           sum(c.VITAMINA2 *(b.FOODBASEQTY/100)) / count(*) ASVTAMA3,
                           sum(c.VITAMINA3 *(b.FOODBASEQTY/100)) / count(*) ASVTAMA4,
                           sum(c.VITAMIND  *(b.FOODBASEQTY/100)) / count(*) ASBTAMD ,
                           sum(c.VITAMINE  *(b.FOODBASEQTY/100)) / count(*) ASBTAME ,
                           sum(c.VITAMINC  *(b.FOODBASEQTY/100)) / count(*) ASVTANC ,
                           sum(c.VITAMINB1 *(b.FOODBASEQTY/100)) / count(*) ASVTAMB1,
                           sum(c.VITAMINB2 *(b.FOODBASEQTY/100)) / count(*) ASVTAMB2,
                           sum(c.NAIASIN   *(b.FOODBASEQTY/100)) / count(*) ASNAIASN,
                           sum(c.VITAMINB6 *(b.FOODBASEQTY/100)) / count(*) ASBTAMB6,
                           sum(c.HYDACD    *(b.FOODBASEQTY/100)) / count(*) ASHYDACD,
                           sum(c.VITAMINB12*(b.FOODBASEQTY/100)) / count(*) ASBTAM12,
                           sum(c.ABORATE   *(b.FOODBASEQTY/100)) / count(*) ASGABBRT,
                           sum(c.COLEST    *(b.FOODBASEQTY/100)) / count(*) ASCOLEST,
                           sum(c.TOTFAT    *(b.FOODBASEQTY/100)) / count(*) ASTOTFAT,
                           sum(c.SATFAT    *(b.FOODBASEQTY/100)) / count(*) ASSATFAT,
                           sum(c.UNIFAT    *(b.FOODBASEQTY/100)) / count(*) ASUNIFAT,
                           sum(c.MULFAT    *(b.FOODBASEQTY/100)) / count(*) ASMULFAT,
                           sum(c.AKALO     *(b.FOODBASEQTY/100)) / count(*) ASBTAMA5,
                           sum(c.PROAKA    *(b.FOODBASEQTY/100)) / count(*) ASBTAMA6,
                           sum(c.LYCOPN    *(b.FOODBASEQTY/100)) / count(*) ASLYCOPN,
                           sum(c.LUTEIN    *(b.FOODBASEQTY/100)) / count(*) ASLUTEIN,
                           sum(c.ALCHOL    *(b.FOODBASEQTY/100)) / count(*) ASALCOHL,
                           sum(c.FIBER     *(b.FOODBASEQTY/100)) / count(*) ASFIBER
                      from SMQUESAT a, SUSMCFDT c, SMQUESMT b, SMQUESAT d
                     where a.PATNO    = '&IsPatno'
                       and a.ORDDATE  = to_date(&ItOrddate,'YYYYMMDD')
                  /*   and a.QPKG    = 'FOOD' 20090729 */
                       and a.QPKG  in ('FOOD','FXXD')
                       and a.QCODE1   = 'QN01'
                       and a.ACODE3   = b.QCODE
                       and c.OPERTYP  = 'A'
                       and b.FOODCODE = c.SMCFCODE
                       and a.PATNO    = d.PATNO
                       and a.ORDDATE  = d.ORDDATE
                  /*   and d.QPKG    = 'FOOD' 20090729 */
                       and d.QPKG  in ('FOOD','FXXD')
                       and d.ACODE3   = 'F010'
                     group by d.QCODE1
                     union all
                    select /*+ INDEX(a SMQUESAT_PK) INDEX(c SUSMCFDT_PK) INDEX (b SMQUESMT_PK) */
                           a.QCODE1 cd,
                           max(c.ENERGY   *(b.FOODBASEQTY/100)), max(c.WATER     *(b.FOODBASEQTY/100)),
                           max(c.PROTEIN  *(b.FOODBASEQTY/100)), max(c.FAT       *(b.FOODBASEQTY/100)),
                           max(c.CALBDT   *(b.FOODBASEQTY/100)), max(c.CELOSE    *(b.FOODBASEQTY/100)),
                           max(c.LIME     *(b.FOODBASEQTY/100)), max(c.CALCIUM   *(b.FOODBASEQTY/100)),
                           max(c.INN      *(b.FOODBASEQTY/100)), max(c.FE        *(b.FOODBASEQTY/100)),
                           max(c.ZINC     *(b.FOODBASEQTY/100)), max(c.MAGNE     *(b.FOODBASEQTY/100)),
                           max(c.NATRIUM  *(b.FOODBASEQTY/100)), max(c.KALLIUM   *(b.FOODBASEQTY/100)),
                           max(c.VITAMINA1*(b.FOODBASEQTY/100)), max(c.VITAMINA2 *(b.FOODBASEQTY/100)),
                           max(c.VITAMINA3*(b.FOODBASEQTY/100)), max(c.VITAMIND  *(b.FOODBASEQTY/100)),
                           max(c.VITAMINE *(b.FOODBASEQTY/100)), max(c.VITAMINC  *(b.FOODBASEQTY/100)),
                           max(c.VITAMINB1*(b.FOODBASEQTY/100)), max(c.VITAMINB2 *(b.FOODBASEQTY/100)),
                           max(c.NAIASIN  *(b.FOODBASEQTY/100)), max(c.VITAMINB6 *(b.FOODBASEQTY/100)),
                           max(c.HYDACD   *(b.FOODBASEQTY/100)), max(c.VITAMINB12*(b.FOODBASEQTY/100)),
                           max(c.ABORATE  *(b.FOODBASEQTY/100)), max(c.COLEST    *(b.FOODBASEQTY/100)),
                           max(c.TOTFAT   *(b.FOODBASEQTY/100)), max(c.SATFAT    *(b.FOODBASEQTY/100)),
                           max(c.UNIFAT   *(b.FOODBASEQTY/100)), max(c.MULFAT    *(b.FOODBASEQTY/100)),
                           max(c.AKALO    *(b.FOODBASEQTY/100)), max(c.PROAKA    *(b.FOODBASEQTY/100)),
                           max(c.LYCOPN   *(b.FOODBASEQTY/100)), max(c.LUTEIN    *(b.FOODBASEQTY/100)),
                           max(c.ALCHOL   *(b.FOODBASEQTY/100)), max(c.FIBER     *(b.FOODBASEQTY/100))
                      from SMQUESAT a, SUSMCFDT c, SMQUESMT b
                     where a.PATNO    = '&IsPatno'
                       and a.ORDDATE  = to_date(&ItOrddate,'YYYYMMDD')
                  /*   and a.QPKG    = 'FOOD' 20090729 */
                       and a.QPKG  in ('FOOD','FXXD')
                       and a.QCODE1 in ('QD01','QD02','QD03','QH01','QH02','QH03' )
                       and a.QCODE1   = b.QCODE
                       and c.OPERTYP  = 'A'
                       and b.FOODCODE = c.SMCFCODE
                     group by a.QCODE1
                     union all
                     /* 야채즙 기준은 d.FOODBASEQTY으로 한다. */
                     select /*+ INDEX(a SMQUESAT_PK) INDEX(c SUSMCFDT_PK) INDEX (b SMQUESMT_PK) */
                           a.QCODE1 cd,
                           sum(c.ENERGY    *(d.FOODBASEQTY/100)) / count(*) ASENERGE,
                           sum(c.WATER     *(d.FOODBASEQTY/100)) / count(*) ASWATER ,
                           sum(c.PROTEIN   *(d.FOODBASEQTY/100)) / count(*) ASANMPTN,
                           sum(c.FAT       *(d.FOODBASEQTY/100)) / count(*) ASFAT   ,
                           sum(c.CALBDT    *(d.FOODBASEQTY/100)) / count(*) ASCALBDT,
                           sum(c.CELOSE    *(d.FOODBASEQTY/100)) / count(*) ASCELOSE,
                           sum(c.LIME      *(d.FOODBASEQTY/100)) / count(*) ASLIME  ,
                           sum(c.CALCIUM   *(d.FOODBASEQTY/100)) / count(*) ASCALCIM,
                           sum(c.INN       *(d.FOODBASEQTY/100)) / count(*) ASIN    ,
                           sum(c.FE        *(d.FOODBASEQTY/100)) / count(*) ASSTEEL ,
                           sum(c.ZINC      *(d.FOODBASEQTY/100)) / count(*) ASZINC  ,
                           sum(c.MAGNE     *(d.FOODBASEQTY/100)) / count(*) ASMGNTSM,
                           sum(c.NATRIUM   *(d.FOODBASEQTY/100)) / count(*) ASNATRIM,
                           sum(c.KALLIUM   *(d.FOODBASEQTY/100)) / count(*) ASKALIUM,
                           sum(c.VITAMINA1 *(d.FOODBASEQTY/100)) / count(*) ASVTAMA2,
                           sum(c.VITAMINA2 *(d.FOODBASEQTY/100)) / count(*) ASVTAMA3,
                           sum(c.VITAMINA3 *(d.FOODBASEQTY/100)) / count(*) ASVTAMA4,
                           sum(c.VITAMIND  *(d.FOODBASEQTY/100)) / count(*) ASBTAMD ,
                           sum(c.VITAMINE  *(d.FOODBASEQTY/100)) / count(*) ASBTAME ,
                           sum(c.VITAMINC  *(d.FOODBASEQTY/100)) / count(*) ASVTANC ,
                           sum(c.VITAMINB1 *(d.FOODBASEQTY/100)) / count(*) ASVTAMB1,
                           sum(c.VITAMINB2 *(d.FOODBASEQTY/100)) / count(*) ASVTAMB2,
                           sum(c.NAIASIN   *(d.FOODBASEQTY/100)) / count(*) ASNAIASN,
                           sum(c.VITAMINB6 *(d.FOODBASEQTY/100)) / count(*) ASBTAMB6,
                           sum(c.HYDACD    *(d.FOODBASEQTY/100)) / count(*) ASHYDACD,
                           sum(c.VITAMINB12*(d.FOODBASEQTY/100)) / count(*) ASBTAM12,
                           sum(c.ABORATE   *(d.FOODBASEQTY/100)) / count(*) ASGABBRT,
                           sum(c.COLEST    *(d.FOODBASEQTY/100)) / count(*) ASCOLEST,
                           sum(c.TOTFAT    *(d.FOODBASEQTY/100)) / count(*) ASTOTFAT,
                           sum(c.SATFAT    *(d.FOODBASEQTY/100)) / count(*) ASSATFAT,
                           sum(c.UNIFAT    *(d.FOODBASEQTY/100)) / count(*) ASUNIFAT,
                           sum(c.MULFAT    *(d.FOODBASEQTY/100)) / count(*) ASMULFAT,
                           sum(c.AKALO     *(d.FOODBASEQTY/100)) / count(*) ASBTAMA5,
                           sum(c.PROAKA    *(d.FOODBASEQTY/100)) / count(*) ASBTAMA6,
                           sum(c.LYCOPN    *(d.FOODBASEQTY/100)) / count(*) ASLYCOPN,
                           sum(c.LUTEIN    *(d.FOODBASEQTY/100)) / count(*) ASLUTEIN,
                           sum(c.ALCHOL    *(d.FOODBASEQTY/100)) / count(*) ASALCOHL,
                           sum(c.FIBER     *(d.FOODBASEQTY/100)) / count(*) ASFIBER
                      from SMQUESAT a,SUSMCFDT c,SMQUESMT b,  SMQUESMT d
                     where a.PATNO = '&IsPatno'
                       and a.ORDDATE = to_date(&ItOrddate,'YYYYMMDD')
                       and a.QPKG  in ('FOOD','FXXD')
                       and a.QCODE1 = 'QH19'
                       and a.ACODE3   = b.QCODE
                       and c.OPERTYP  = 'A'
                       and b.FOODCODE = c.SMCFCODE
                       and a.qcode1 = d.qcode
                     group by a.QCODE1
                       ) food_sel
            where qty_sel.cd = bin_sel.cd
              and qty_sel.cd = food_sel.cd  group by qty_sel.cd
union all
 select     /* 2 번 커피 */
                   food.q01,
                    sum(food.ASENERGE*(food.base/100) * bin.bin) ASENERGE,
                   sum(food.ASWATER *(food.base/100) * bin.bin) ASWATER ,
                   sum(food.ASANMPTN*(food.base/100) * bin.bin) ASANMPTN,
                   sum(food.ASFAT   *(food.base/100) * bin.bin) ASFAT   ,
                   sum(food.ASCALBDT*(food.base/100) * bin.bin) ASCALBDT,
                   sum(food.ASFIBER *(food.base/100) * bin.bin) ASFIBER ,
                   sum(food.ASLIME  *(food.base/100) * bin.bin) ASLIME  ,
                   sum(food.ASCALCIM*(food.base/100) * bin.bin) ASCALCIM,
                   sum(food.ASIN    *(food.base/100) * bin.bin) ASIN    ,
                   sum(food.ASSTEEL *(food.base/100) * bin.bin) ASSTEEL ,
                   sum(food.ASZINC  *(food.base/100) * bin.bin) ASZINC  ,
                   sum(food.ASMGNTSM*(food.base/100) * bin.bin) ASMGNTSM,
                   sum(food.ASNATRIM*(food.base/100) * bin.bin) ASNATRIM,
                   sum(food.ASKALIUM*(food.base/100) * bin.bin) ASKALIUM,
                   sum(food.ASVTAMA2*(food.base/100) * bin.bin) ASVTAMA2,
                   sum(food.ASVTAMA3*(food.base/100) * bin.bin) ASVTAMA3,
                   sum(food.ASVTAMA4*(food.base/100) * bin.bin) ASVTAMA4,
                   sum(food.ASBTAMD *(food.base/100) * bin.bin) ASBTAMD ,
                   sum(food.ASBTAME *(food.base/100) * bin.bin) ASBTAME ,
                   sum(food.ASVTANC *(food.base/100) * bin.bin) ASVTANC ,
                   sum(food.ASVTAMB1*(food.base/100) * bin.bin) ASVTAMB1,
                   sum(food.ASVTAMB2*(food.base/100) * bin.bin) ASVTAMB2,
                   sum(food.ASNAIASN*(food.base/100) * bin.bin) ASNAIASN,
                   sum(food.ASBTAMB6*(food.base/100) * bin.bin) ASBTAMB6,
                   sum(food.ASHYDACD*(food.base/100) * bin.bin) ASHYDACD,
                   sum(food.ASBTAM12*(food.base/100) * bin.bin) ASBTAM12,
                   sum(food.ASGABBRT*(food.base/100) * bin.bin) ASGABBRT,
                   sum(food.ASCOLEST*(food.base/100) * bin.bin) ASCOLEST,
                   sum(food.ASTOTFAT*(food.base/100) * bin.bin) ASTOTFAT,
                   sum(food.ASSATFAT*(food.base/100) * bin.bin) ASSATFAT,
                   sum(food.ASUNIFAT*(food.base/100) * bin.bin) ASUNIFAT,
                   sum(food.ASMULFAT*(food.base/100) * bin.bin) ASMULFAT,
                   sum(food.ASBTAMA5*(food.base/100) * bin.bin) ASBTAMA5,
                   sum(food.ASBTAMA6*(food.base/100) * bin.bin) ASBTAMA6,
                   sum(food.ASLYCOPN*(food.base/100) * bin.bin) ASLYCOPN,
                   sum(food.ASLUTEIN*(food.base/100) * bin.bin) ASLUTEIN,
                   sum(food.ASALCOHL*(food.base/100) * bin.bin) ASALCOHL
             from (select /*+ INDEX ( a SMQUESAT_PK ) INDEX ( b SMQUESMT_PK) */
                          a.QCODE1 q01,
                          max(b.FOODBASEQTY* sel. bin) Bin
                     from
                          SMQUESAT a,
                          SMQUESMT b,
                         (select /*+ INDEX ( a SMQUESAT_PK ) INDEX ( b SMQUESMT_PK) */
                                 b.FOODBASEQTY Bin
                            from
                                 SMQUESAT a,
                                 SMQUESMT b
                           where a.PATNO   = '&IsPatno'
                             and a.ORDDATE = to_date(&ItOrddate,'YYYYMMDD')
                          /* and a.QPKG    = 'FOOD' 20090729 */
                             and a.QPKG    in ('FOOD','FXXD')
                             and a.QCODE1  = 'QS01'
                             and a.ACODE1  = b.QCODE
                          and ROWNUM = 1) sel
                    where a.PATNO   = '&IsPatno'
                      and a.ORDDATE = to_date(&ItOrddate,'YYYYMMDD')
                   /* and a.QPKG    = 'FOOD' 20090729 */
                      and a.QPKG   in ('FOOD','FXXD')
                      and a.QCODE1 in ('QN02','QN03')
                      and a.ACODE1  = b.QCODE (+)
                    group by a.QCODE1) bin,
                  (select /*+ INDEX ( a SMQUESAT_PK ) INDEX ( c SUSMCFDT_PK) INDEX ( b SMQUESMT_PK) */
                          a.QCODE1 q01,
                          max(b.FOODBASEQTY) Base,
                          max(c.ENERGY   ) ASENERGE,  max(c.WATER     ) ASWATER ,
                          max(c.PROTEIN  ) ASANMPTN,  max(c.FAT       ) ASFAT   ,
                          max(c.CALBDT   ) ASCALBDT,  max(c.CELOSE    ) ASCELOSE,
                          max(c.LIME     ) ASLIME  ,  max(c.CALCIUM   ) ASCALCIM,
                          max(c.INN      ) ASIN    ,  max(c.FE        ) ASSTEEL ,
                          max(c.ZINC     ) ASZINC  ,  max(c.MAGNE     ) ASMGNTSM,
                          max(c.NATRIUM  ) ASNATRIM,  max(c.KALLIUM   ) ASKALIUM,
                          max(c.VITAMINA1) ASVTAMA2,  max(c.VITAMINA2 ) ASVTAMA3,
                          max(c.VITAMINA3) ASVTAMA4,  max(c.VITAMIND  ) ASBTAMD ,
                          max(c.VITAMINE ) ASBTAME ,  max(c.VITAMINC  ) ASVTANC ,
                          max(c.VITAMINB1) ASVTAMB1,  max(c.VITAMINB2 ) ASVTAMB2,
                          max(c.NAIASIN  ) ASNAIASN,  max(c.VITAMINB6 ) ASBTAMB6,
                          max(c.HYDACD   ) ASHYDACD,  max(c.VITAMINB12) ASBTAM12,
                          max(c.ABORATE  ) ASGABBRT,  max(c.COLEST    ) ASCOLEST,
                          max(c.TOTFAT   ) ASTOTFAT,  max(c.SATFAT    ) ASSATFAT,
                          max(c.UNIFAT   ) ASUNIFAT,  max(c.MULFAT    ) ASMULFAT,
                          max(c.AKALO    ) ASBTAMA5,  max(c.PROAKA    ) ASBTAMA6,
                          max(c.LYCOPN   ) ASLYCOPN,  max(c.LUTEIN    ) ASLUTEIN,
                          max(c.ALCHOL   ) ASALCOHL,  max(c.FIBER     ) ASFIBER
                     from
                          SMQUESAT a,
                          SUSMCFDT c,
                          SMQUESMT b
                    where a.PATNO = '&IsPatno'
                      and a.ORDDATE = to_date(&ItOrddate,'YYYYMMDD')
                   /* and a.QPKG    = 'FOOD' 20090729 */
                      and a.QPKG    in ('FOOD','FXXD')
                      and a.QCODE1 in ('QN02','QN03')
                      and b.QCODE = a.QCODE1
                      and c.OPERTYP = 'A'
                      and b.FOODCODE = c.SMCFCODE
                 group by a.QCODE1) food
            where food.q01 = bin.q01
              group by food.q01
union all
select
                   base.q01,
                   sum(base.ASENERGE*(base.base/100)*Qty.qty*Bin.Bin) ASENERGE,
                   sum(base.ASWATER *(base.base)*Qty.qty*Bin.Bin)     ASWATER ,
                   sum(base.ASANMPTN*(base.base/100)*Qty.qty*Bin.Bin) ASANMPTN,
                   sum(base.ASFAT   *(base.base/100)*Qty.qty*Bin.Bin) ASFAT   ,
                   sum(base.ASCALBDT*(base.base/100)*Qty.qty*Bin.Bin) ASCALBDT,
                   sum(base.ASFIBER *(base.base/100)*Qty.qty*Bin.Bin) ASFIBER ,
                   sum(base.ASLIME  *(base.base/100)*Qty.qty*Bin.Bin) ASLIME  ,
                   sum(base.ASCALCIM*(base.base/100)*Qty.qty*Bin.Bin) ASCALCIM,
                   sum(base.ASIN    *(base.base/100)*Qty.qty*Bin.Bin) ASIN    ,
                   sum(base.ASSTEEL *(base.base/100)*Qty.qty*Bin.Bin) ASSTEEL ,
                   sum(base.ASZINC  *(base.base/100)*Qty.qty*Bin.Bin) ASZINC  ,
                   sum(base.ASMGNTSM*(base.base/100)*Qty.qty*Bin.Bin) ASMGNTSM,
                   sum(base.ASNATRIM*(base.base/100)*Qty.qty*Bin.Bin) ASNATRIM,
                   sum(base.ASKALIUM*(base.base/100)*Qty.qty*Bin.Bin) ASKALIUM,
                   sum(base.ASVTAMA2*(base.base/100)*Qty.qty*Bin.Bin) ASVTAMA2,
                   sum(base.ASVTAMA3*(base.base/100)*Qty.qty*Bin.Bin) ASVTAMA3,
                   sum(base.ASVTAMA4*(base.base/100)*Qty.qty*Bin.Bin) ASVTAMA4,
                   sum(base.ASBTAMD *(base.base/100)*Qty.qty*Bin.Bin) ASBTAMD ,
                   sum(base.ASBTAME *(base.base/100)*Qty.qty*Bin.Bin) ASBTAME ,
                   sum(base.ASVTANC *(base.base/100)*Qty.qty*Bin.Bin) ASVTANC ,
                   sum(base.ASVTAMB1*(base.base/100)*Qty.qty*Bin.Bin) ASVTAMB1,
                   sum(base.ASVTAMB2*(base.base/100)*Qty.qty*Bin.Bin) ASVTAMB2,
                   sum(base.ASNAIASN*(base.base/100)*Qty.qty*Bin.Bin) ASNAIASN,
                   sum(base.ASBTAMB6*(base.base/100)*Qty.qty*Bin.Bin) ASBTAMB6,
                   sum(base.ASHYDACD*(base.base/100)*Qty.qty*Bin.Bin) ASHYDACD,
                   sum(base.ASBTAM12*(base.base/100)*Qty.qty*Bin.Bin) ASBTAM12,
                   sum(base.ASGABBRT*(base.base/100)*Qty.qty*Bin.Bin) ASGABBRT,
                   sum(base.ASCOLEST*(base.base/100)*Qty.qty*Bin.Bin) ASCOLEST,
                   sum(base.ASTOTFAT*(base.base/100)*Qty.qty*Bin.Bin) ASTOTFAT,
                   sum(base.ASSATFAT*(base.base/100)*Qty.qty*Bin.Bin) ASSATFAT,
                   sum(base.ASUNIFAT*(base.base/100)*Qty.qty*Bin.Bin) ASUNIFAT,
                   sum(base.ASMULFAT*(base.base/100)*Qty.qty*Bin.Bin) ASMULFAT,
                   sum(base.ASBTAMA5*(base.base/100)*Qty.qty*Bin.Bin) ASBTAMA5,
                   sum(base.ASBTAMA6*(base.base/100)*Qty.qty*Bin.Bin) ASBTAMA6,
                   sum(base.ASLYCOPN*(base.base/100)*Qty.qty*Bin.Bin) ASLYCOPN,
                   sum(base.ASLUTEIN*(base.base/100)*Qty.qty*Bin.Bin) ASLUTEIN,
                   sum(base.ASALCOHL*(base.base/100)*Qty.qty*Bin.Bin) ASALCOHL
              from (select /*+ INDEX ( a SMQUESAT_PK) INDEX (c SUSMCFDT_PK) INDEX (b SMQUESMT_PK) */
                           /* 멀티식품 기준량 Base sel 기준량 */
                           a.QCODE1 q01,
                           max(b.FOODBASEQTY) Base,
                           max(c.ENERGY   ) ASENERGE, max(c.WATER     ) ASWATER ,
                           max(c.PROTEIN  ) ASANMPTN, max(c.FAT       ) ASFAT   ,
                           max(c.CALBDT   ) ASCALBDT, max(c.CELOSE    ) ASCELOSE,
                           max(c.LIME     ) ASLIME  , max(c.CALCIUM   ) ASCALCIM,
                           max(c.INN      ) ASIN    , max(c.FE        ) ASSTEEL ,
                           max(c.ZINC     ) ASZINC  , max(c.MAGNE     ) ASMGNTSM,
                           max(c.NATRIUM  ) ASNATRIM, max(c.KALLIUM   ) ASKALIUM,
                           max(c.VITAMINA1) ASVTAMA2, max(c.VITAMINA2 ) ASVTAMA3,
                           max(c.VITAMINA3) ASVTAMA4, max(c.VITAMIND  ) ASBTAMD ,
                           max(c.VITAMINE ) ASBTAME , max(c.VITAMINC  ) ASVTANC ,
                           max(c.VITAMINB1) ASVTAMB1, max(c.VITAMINB2 ) ASVTAMB2,
                           max(c.NAIASIN  ) ASNAIASN, max(c.VITAMINB6 ) ASBTAMB6,
                           max(c.HYDACD   ) ASHYDACD, max(c.VITAMINB12) ASBTAM12,
                           max(c.ABORATE  ) ASGABBRT, max(c.COLEST    ) ASCOLEST,
                           max(c.TOTFAT   ) ASTOTFAT, max(c.SATFAT    ) ASSATFAT,
                           max(c.UNIFAT   ) ASUNIFAT, max(c.MULFAT    ) ASMULFAT,
                           max(c.AKALO    ) ASBTAMA5, max(c.PROAKA    ) ASBTAMA6,
                           max(c.LYCOPN   ) ASLYCOPN, max(c.LUTEIN    ) ASLUTEIN,
                           max(c.ALCHOL   ) ASALCOHL, max(c.FIBER     ) ASFIBER
                      from
                           SMQUESAT a,
                           SUSMCFDT c,
            
                     where a.PATNO = '&IsPatno'
                       and a.ORDDATE = to_date(&ItOrddate,'YYYYMMDD')
                  /*   and a.QPKG = 'FOOD' 20090729 */
                       and a.QPKG in ('FOOD','FXXD')
                       and (a.QCODE1 between 'QH04' and 'QH40'
                        or  a.QCODE1 = 'QS01')
                       and b.QCODE = a.QCODE1
                       and c.OPERTYP = 'A'
                       and b.FOODCODE = c.SMCFCODE
                 group by a.QCODE1) base,
                   (select /*+ INDEX (a SMQUESAT_PK) INDEX (b SMQUESMT_PK) */
                           /* 빈도만 있는 식품과 빈도 수량이 있는 식품을 분리하여 수량을 가져옴. */
                           a.QCODE1 q01,
                           max(b.FOODBASEQTY) Qty
                      from
                           SMQUESAT a,
                           SMQUESMT b
                     where a.PATNO = '&IsPatno'
                       and a.ORDDATE = to_date(&ItOrddate,'YYYYMMDD')
                  /*   and a.QPKG = 'FOOD' 20090729 */
                       and a.QPKG in ('FOOD','FXXD')
                       and (a.QCODE1 between 'QH04' and 'QH40'
                       AND  A.QCODE1 NOT IN ('QH15','QH21','QH22','QH23','QH24','QH25','QH26','QH29','QH19','QH39'))
                       and a.ACODE2 = b.QCODE
                     group by a.QCODE1
                     UNION
                    select /*+ INDEX (a SMQUESAT_PK) INDEX (b SMQUESMT_PK) */
                           /* 멀티식품 섭취량 Qty sel 계란은 없음 */
                           a.QCODE1 q01,
                           1   Qty
                      from
                           SMQUESAT a
                     where a.PATNO = '&IsPatno'
                       and a.ORDDATE = to_date(&ItOrddate,'YYYYMMDD')
                  /*   and a.QPKG = 'FOOD' 20090729 */
                       and a.QPKG in ('FOOD','FXXD')
                       AND A.QCODE1 IN ('QH15','QH21','QH22','QH23','QH24','QH25','QH26','QH29','QS01','QH39')) Qty,
                   (select /*+ INDEX (a SMQUESAT_PK) INDEX (b SMQUESMT_PK) */
                           /* 멀티식품 섭취 빈도 구하기 */
                           a.QCODE1 q01,
                           max(b.FOODBASEQTY) Bin
                      from
                           SMQUESAT a,
                           SMQUESMT b
                     where a.PATNO = '&IsPatno'
                       and a.ORDDATE = to_date(&ItOrddate,'YYYYMMDD')
                  /*   and a.QPKG = 'FOOD' 20090729 */
                       and a.QPKG in ('FOOD','FXXD')
                       and (a.QCODE1 between 'QH04' and 'QH40'
                        and a.qcode1 not in ('QH15','QH19')
                        or  a.QCODE1 = 'QS01')
                       and a.ACODE1 = b.QCODE (+)
                     group by a.QCODE1
                     union
                     select 'QH15' q01 ,
                              bin1 - bin2 bin
                      from(
                           select /*+ INDEX (a SMQUESAT_PK) INDEX (b SMQUESMT_PK) */
                                /* 계란은 전란-흰자 값으로*/
                                 max(decode(a.qcode1,'QH15', b.FOODBASEQTY ,0)) bin1 ,
                                 max(decode(a.qcode1,'QH39', b.FOODBASEQTY ,0)) bin2
                           from
                                SMQUESAT a,
                                SMQUESMT b
                          where a.PATNO = '&IsPatno'
                            and a.ORDDATE = to_date(&ItOrddate,'YYYYMMDD')
                            and a.QPKG in ('FOOD','FXXD')
                            and a.qcode1  in ('QH15','QH39')
                            and a.ACODE1 = b.QCODE (+)
                            )) Bin
             where bin.q01    = base.q01
               and qty.q01 (+)= base.q01
             group by base.q01
       ) A
     , SMQUESMT B
 WHERE A.CD = B.QCODE
