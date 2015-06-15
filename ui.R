# This is an application that allows an individual to estimate their 
# Coronary heart disease (CHD) risk at 10 years based on their age, smoking
# status, and other key factors.  
# 
# The Framingham Risk Score is a sex-specific algorithm used to estimate risk.
#-------------------------------------------------------------------------------------------------
library(shiny)
#-------------------------------------------------------------------------------------------------
shinyUI(
    
    pageWithSidebar(
        
        headerPanel('Coronary heart disease (CHD) Risk Score Calculator'),
        
        sidebarPanel(
            
            h4('Please change the following default information to best describe you:'),
            br(),
            selectInput('AgeSelect', 'Age:', 
                        choices = list(
                            '20-34 years' = 1,
                            '35-39 years' = 2,
                            '40-44 years' = 3,
                            '45-49 years' = 4,
                            '50-54 years' = 5,
                            '55-59 years' = 6,
                            '60-64 years' = 7,
                            '65-69 years' = 8,
                            '70-74 years' = 9,
                            '75-79 years' = 10
                            
                        ), selected = 1),
            radioButtons('SexRadioGroup', 'Gender:', 
                         choices = list(
                             'Male',
                             'Female'
                         ), selected = 'Female'),
            br(),
            selectInput('SmokeSelect', 'Smoker?:',
                        choices = list(
                            'Smoker' = 1,
                            'Non-smoker' = 2
                        ), selected = 1),
           
            radioButtons('SBPRadioGroup', 'Currently Treated for High BP',
                         choices = list('Yes', 'No'), selected = 'Yes', T),
            selectInput('SBPSelect', 'Systolic Blood Pressure: Value, mm Hg',
                        choices = list(
                            'Under 120' = 1,
                            '120-129' = 2,
                            '130-139' = 3,
                            '140-159' = 4,
                            '160 or higher' = 5
                        ), selected = 1
            ),
            br(),
            selectInput('TotCholSelect', 'Total Cholesterol, mg/dL',
                        choices = list(
                            'Under 160' = 1,
                            '160-199' = 2,
                            '200-239' = 3,
                            '240-279' = 4,
                            '280 or higher' = 5
                        ), selected = 1),
            selectInput('HDLCholSelect', 'HDL Cholesterol, mg/dL',
                        choices = list(
                            '60 or higher' = 1,
                            '50-59' = 2,
                            '40-49' = 3,
                            'Under 40' = 4
                        ), selected = 1),
            actionButton('RiskButton', 'Estimate Risk')
            
        ), # sidebarPanel
        
        mainPanel(
            
            p('This is an application that allows an individual to estimate their Coronary heart disease (CHD) risk at 10 years based on their age, smoking status, and other key factors.'),
            p('The Framingham Risk Score is a sex-specific algorithm used to estimate risk.'),
            p('For more information on the Framingham Risk Score, follow the link:'),
            a(href = "https://en.wikipedia.org/wiki/Framingham_Risk_Score", "Click Here!"),
            br(),
            h3('Total Risk Points:'),
            textOutput('PointsOutput'),
            br(),
            h3('10-year Risk %:'),
            textOutput('RiskOutput'),
            br(),
            h3('Estimated Risk Level:'),
            textOutput('RiskLevel'),
            br(),
            br(),
            h4('These estimates are not conclusive, please consult a physician if you have any questions or concerns.')
        ) # mainPanel
        
    ) # pageWithSidebar
    
) # shinyUI
#-------------------------------------------------------------------------------------------------