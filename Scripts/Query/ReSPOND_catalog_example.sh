# TJU #
LIST=/cbica/projects/brain_tumor_external/BT_Jefferson/Lists/20220512_TJU_ReSPOND_baselines.txt
DATA=/cbica/projects/brain_tumor_external/BT_Jefferson/Data/ReNamed
PROTOCOLS=/cbica/projects/brain_tumor_external/BT_Jefferson/jefferson_2020/Protocols
outlist=/cbica/projects/brain_tumor_external/BT_Jefferson/Lists/20220512_TJU_ReSPOND_baseline_5mods.txt

# # Penn #
# LIST=/cbica/projects/brain_tumor/Brain_Tumor_2020/Projects/20210215_ReSPOND_survival/List/20220406_Survival_baselines.txt
# DATA=/cbica/projects/brain_tumor/Brain_Tumor_2020/Data
# PROTOCOLS=/cbica/projects/brain_tumor/Brain_Tumor_2020/Protocols
# outlist=/cbica/projects/brain_tumor/Brain_Tumor_2020/Projects/20210215_ReSPOND_survival/List/20220406_Survival_baselines_5mods.txt

SSfinal=$PROTOCOLS/5_SSFinal

# for line in $(cat $LIST | awk 'NR>1')
for t in $(cat $LIST | awk 'NR>0')
do

    # line="${line/$'\r'/}"

    # t=$(echo $line | cut -d, -f3)
    # sub=$(echo $line | cut -d, -f1)
    sub=$(echo $t | cut -d_ -f1)

    SSdir=$SSfinal/$sub/$t
    datadir=$DATA/$sub/$t

    adc=$datadir/${t}_adc.nii.gz
    # adc=$datadir/${t}_dti.nii.gz
    
    # t1ce=$SSdir/${t}_t1ce_LPS_rSRI_SSFinal.nii.gz
    # t1=$SSdir/${t}_t1_LPS_rSRI_SSFinal.nii.gz
    # t2=$SSdir/${t}_t2_LPS_rSRI_SSFinal.nii.gz
    # flair=$SSdir/${t}_flair_LPS_rSRI_SSFinal.nii.gz

    t1ce=$datadir/${t}_t1ce.nii.gz
    t1=$datadir/${t}_t1.nii.gz
    t2=$datadir/${t}_t2.nii.gz
    flair=$datadir/${t}_flair.nii.gz
        
    modcount=0

    for mod in $adc $t1ce $t1 $t2 $flair
    do
        if [[ -f $mod ]]
        then
            (( modcount++ ))
        fi
    done

    if [ $modcount == 5 ]
    then
        echo $t
    fi
done