library(shiny)
library(shinythemes)
library(shinyREDCap)
library (reactable)
library(httr)
library(stringi)
library(jsonlite)
library(DT)
library(reticulate)
library(shinyWidgets)
library(rjson)


# Allow for multiple options to be selected per filter

# Setting up UI
ui <- fluidPage(theme = shinytheme('cerulean'),
                navbarPage(
                  
                  "REDCap App (V1.0)",
                  
                  # Data fetching and pipeline running tab
                  tabPanel("Data Fetch & Pipeline Runner",
                           
                           # Filter sidebar
                           sidebarPanel(
                             
                             tags$h3('Filters:'),
                             
                             helpText('View and export demographic information as filtered.'),
                             
                             textInput('project',
                                       label = 'Projects:', ''),
                             
                             actionButton('getFields', 'Get Options'),
                             
                             uiOutput('formsDrop'),
                             
                             uiOutput('fieldsDrop'),
                             
                             uiOutput('armsDrop'),
                             
                             uiOutput('eventsDrop'),
                             
                             uiOutput('recordsText'),
                             
                             # textInput('fields',
                             #           label = 'Fields:', ''),
                             # 
                             # textInput('forms',
                             #           label = 'Forms:', ''),
                             # 
                             # textInput('arm',
                             #           label = 'Arm:', ''),
                             # 
                             # textInput('events',
                             #           label = 'Events:', ''),
                             # 
                             # textInput('pipe',
                             #           label = 'Pipe:', ''),
                             # 
                             # textInput('records',
                             #           label = 'Records:', ''),
                             
                             # Execute fetch
                             h3(''),
                             
                             actionButton('updateUrl', 'Analyze Output'),
                             
                             # Outputted URL
                             h3('Current URL:'),
                             
                             verbatimTextOutput('url')
                             
                           ),
                           
                           # Displays resulting data table from filters
                           mainPanel(
                             
                             h1('Data Viewer:'),
                             
                             tableOutput('table'),
                             
                             # Download data table as csv
                             downloadButton('downloadData', 'Download'),
                             
                             actionButton('openDtale', 'Open in D-Tale')
                             
                           )
                  ),
                  
                  # Project adding tab
                  tabPanel(
                    
                    title = "Add, Remove, Update a Project",
                    
                    h1('Status:'),
                    
                    verbatimTextOutput('status'),
                    
                    hr(),
                    
                    fluidRow(
                      column(3,
                             # User requirements for adding a project to REDCap database
                             #tags$h3('Project Details:'),
                             
                             helpText('Add a project on REDCap. Please provide the project name, url, and token.'),
                             
                             textInput('new_proj', 'Project Name:', ''),
                             
                             textInput('new_URL', 'Project URL:', ''),
                             
                             textInput('new_token', 'Project Token:', ''),
                             
                             # Execute adding a project
                             actionButton('add_Proj', 'Add Project'),
                             
                             verbatimTextOutput('add_results')
                             
                      ),
                      column(4, offset = 1,
                             helpText('Remove a project on REDCap. Please provide the project name. '),
                             
                             textInput('rem_proj', 'Project Name:', ''),
                             
                             actionButton('remove', 'Remove Project'),
                             
                             verbatimTextOutput('rem_results')
                      ),
                      column(4,
                             helpText('Update a project on REDCap. Please provide the updated project name, url, or token.'),
                             
                             textInput('upd_proj', 'New Project Name:', ''),
                             
                             textInput('upd_URL', 'New Project URL:', ''),
                             
                             textInput('upd_token', 'New Token URL', ''),
                             
                             actionButton('update', 'Update Project'),
                             
                             verbatimTextOutput('upd_results')
                      )
                    )
                    # "Add a Project",
                    # 
                    # sidebarPanel(
                    #   
                    #   # User requirements for adding a project to REDCap database
                    #   tags$h3('Project Details:'),
                    #   
                    #   helpText('Add a project on REDCap. Please provide the project name, url, and token.'),
                    #   
                    #   textInput('new_proj', 'Project Name:', ''),
                    #   
                    #   textInput('new_URL', 'Project URL:', ''),
                    #   
                    #   textInput('new_token', 'Project Token:', ''),
                    #   
                    #   # Execute adding a project
                    #   actionButton('add_Proj', 'Add Project'),
                    #   
                    #   verbatimTextOutput('add_results')
                    #   
                    # ),
                    # 
                    # mainPanel(
                    #   
                    #   # Display success/error in adding project
                    #   h1('Status:'),
                    #   
                    #   verbatimTextOutput('status')
                    # )
                  ),
                  
                  # Adding a pipe tab
                  # TODO: Implement Pipe adding functionality
                  tabPanel(
                    
                    "Add a Pipe",
                    
                    textAreaInput('pipecode', 'Code for Pipes:', width='1000px', height = '500px'),
                    
                    verbatimTextOutput('code'),
                    
                    downloadButton('downloadPipe', 'Download Pipe')
                  )
                )
)