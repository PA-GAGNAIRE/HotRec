#!/bin/bash

cd /home/RUN_LD/ne25m_ss10_bp5/
echo 'Starting Condition 1: Ne = 2.5e4, Sample Size = 10, Block Penalty = 5'
bash ./ne25m_ss10_bp5/pipeline_ldhelmet.sh
cd /home/RUN_LD/ne25m_ss10_bp10/
echo 'Starting Condition 2: Ne = 2.5e4, Sample Size = 10, Block Penalty = 10'
bash ./ne25m_ss10_bp10/pipeline_ldhelmet.sh
cd /home/RUN_LD/ne25m_ss10_bp50/
echo 'Starting Condition 3: Ne = 2.5e4, Sample Size = 10, Block Penalty = 50'
bash ./ne25m_ss10_bp50/pipeline_ldhelmet.sh
cd /home/RUN_LD/ne25m_ss20_bp5/
echo 'Starting Condition 4: Ne = 2.5e4, Sample Size = 20, Block Penalty = 5'
bash ./ne25m_ss20_bp5/pipeline_ldhelmet.sh
cd /home/RUN_LD/ne25m_ss20_bp10/
echo 'Starting Condition 5: Ne = 2.5e4, Sample Size = 20, Block Penalty = 10'
bash ./ne25m_ss20_bp10/pipeline_ldhelmet.sh
cd /home/RUN_LD/ne25m_ss20_bp50/
echo 'Starting Condition 6: Ne = 2.5e4, Sample Size = 20, Block Penalty = 50'
bash ./ne25m_ss20_bp50/pipeline_ldhelmet.sh
cd /home/RUN_LD/ne250m_ss10_bp5/
echo 'Starting Condition 7: Ne = 2.5e5, Sample Size = 10, Block Penalty = 5'
bash ./ne250m_ss10_bp5/pipeline_ldhelmet.sh
cd /home/RUN_LD/ne250m_ss10_bp10/
echo 'Starting Condition 8: Ne = 2.5e5, Sample Size = 10, Block Penalty = 10'
bash ./ne250m_ss10_bp5/pipeline_ldhelmet.sh
cd /home/RUN_LD/ne250m_ss10_bp50/
echo 'Starting Condition 9: Ne = 2.5e5, Sample Size = 10, Block Penalty = 50'
bash ./ne250m_ss10_bp10/pipeline_ldhelmet.sh
cd /home/RUN_LD/ne250m_ss20_bp5/
echo 'Starting Condition 10: Ne = 2.5e5, Sample Size = 20, Block Penalty = 5'
bash ./ne250m_ss20_bp10/pipeline_ldhelmet.sh
cd /home/RUN_LD/ne250m_ss20_bp10/
echo 'Starting Condition 11: Ne = 2.5e5, Sample Size = 20, Block Penalty = 10'
bash ./ne250m_ss20_bp50/pipeline_ldhelmet.sh
cd /home/RUN_LD/ne250m_ss20_bp50/
echo 'Starting Condition 12: Ne = 2.5e5, Sample Size = 20, Block Penalty = 50'
bash ./ne250m_ss20_bp50/pipeline_ldhelmet.sh

echo 'Finished running all 12 conditions'
