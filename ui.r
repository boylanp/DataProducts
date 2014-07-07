library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Preditor-Prey Relationship based on the Lotka-Volterra Equations"), 
  sidebarPanel(
    h4('Documentation:'),
    helpText('Change initial populations and growth/decay parameters to model the relationship between fox and bunny populations over time.  Default values are already filled in.'),
    h4('Set Initial Conditions:'),
    numericInput('start1', "Initial Population of Bunnies", value = 10, min = 1, max = 100),
    numericInput('start2', "Initial Population of Foxes", value = 5, min = 1, max = 100),
    sliderInput('alpha', "Growth rate of Bunnies", value = 1, min=0, max = 2, step = 0.05),
    sliderInput('beta', "Rate at which Foxes eat Bunnies", value = 0.6, min=0, max = 2, step = 0.05),
    sliderInput('gamma', "Death rate of Foxes", value = 2, min=0, max = 3, step = 0.05),
    sliderInput('delta', "Rate at which Foxes increase due to eating Bunnies", value = 0.5, min=0, max = 2, step = 0.05)
    ), 
  mainPanel(
    h4('Population of Bunnies and Foxes'),
    plotOutput('newHist')
    ) 
  ))