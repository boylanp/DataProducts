library(shiny)
library(shinyapps)
library(deSolve)
library(ggplot2)
library(reshape2)

fun <- function (Time, State, Pars) {
  with(as.list(c(State, Pars)), {
    dx = Bunnies * (alpha - beta*Foxes)
    dy = -Foxes * (gamma - delta*Bunnies)
    return(list(c(dx, dy)))
  })
}

shinyServer(
  function(input, output) {
    output$newHist <- renderPlot({
      Pars = c(alpha = input$alpha, beta = input$beta, gamma = input$gamma, delta = input$delta)
      State = c(Bunnies = input$start1, Foxes = input$start2)
      Time = seq(0, 20, by = .05)
      
      out = as.data.frame(ode(func = fun, y = State, parms = Pars, times = Time))
      out2 = melt(out, id.vars = "time")

      ggplot(data = out2, aes(x=time, y = value, group = variable, colour=variable))+
        geom_line(size=3) +
        #geom_point(size = 4, shape = 21, fill = "white") + 
        xlab('Time') + 
        ylab('Population') +
        theme(axis.text=element_text(size=18)) + 
        theme(axis.title = element_text(size=18)) + 
        theme(legend.text = element_text(size = 18)) + 
        theme(legend.title = element_blank())
      #legend("topright", c("Bunnies", "Foxes"), lty = c(1, 2), col = c(1, 2), box.lwd = 0)

    })
  }
  )