#!/bin/bash

bash ./ne25m_ss10_bp5/pipeline_ldhelmet.sh
bash ./ne25m_ss10_bp10/pipeline_ldhelmet.sh
bash ./ne25m_ss10_bp50/pipeline_ldhelmet.sh
bash ./ne25m_ss20_bp5/pipeline_ldhelmet.sh
bash ./ne25m_ss20_bp10/pipeline_ldhelmet.sh
bash ./ne25m_ss20_bp50/pipeline_ldhelmet.sh
bash ./ne250m_ss10_bp5/pipeline_ldhelmet.sh
bash ./ne250m_ss10_bp5/pipeline_ldhelmet.sh
bash ./ne250m_ss10_bp10/pipeline_ldhelmet.sh
bash ./ne250m_ss20_bp10/pipeline_ldhelmet.sh
bash ./ne250m_ss20_bp50/pipeline_ldhelmet.sh
bash ./ne250m_ss20_bp50/pipeline_ldhelmet.sh

echo 'Finished running all 12 conditions'
