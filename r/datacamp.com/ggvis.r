
# ggvis is already installed for you; now load it and start playing around

library(ggvis)
# change the code below to plot the disp variable of mtcars on the x axis
mtcars %>% ggvis(~disp, ~mpg) %>% layer_points()


faithful %>%
    ggvis(~waiting, ~eruptions, fill := "red") %>%
    layer_points() %>%
    add_axis("y", title = "Duration of eruption (m)",
             values = c(2, 3, 4, 5), subdivide = 9) %>%
    add_axis("x", title = "Time since previous eruption (m)")


    # Rewrite the code with the pipe operator
faithful %>% ggvis(~waiting, ~eruptions) %>% layer_points


# Modify this graph to map the size property to the pressure variable
pressure %>% ggvis(~temperature, ~pressure, size = ~pressure) %>% layer_points()


# Modify this graph by setting the size property
pressure %>% ggvis(~temperature, ~pressure, size := 100) %>% layer_points()


# Fix this code to set the fill property to red
pressure %>% ggvis(~temperature, ~pressure, fill := "red") %>% layer_points()


# Change the code to set the fills using pressure$black. pressure$black is loaded into workspace.
pressure %>%
  ggvis(~temperature, ~pressure,
        fill := ~black) %>%
  layer_points()


# Plot the faithful data as described in the second instruction
faithful %>%
  ggvis(~waiting, ~eruptions,
       size = ~eruptions,
       opacity := 0.5, fill := 'blue', stroke := 'black') %>%
  layer_points()


# Plot the faithful data as described in the third instruction
faithful %>%
  ggvis(~waiting, ~eruptions,
    fillOpacity = ~eruptions,
    size := 100, fill := 'red',  stroke := 'red', shape := 'cross') %>%
  layer_points()



  # Build a histogram of the waiting variable of the faithful data set.
  faithful %>% ggvis( ~waiting ) %>% layer_histograms()


  # Build the same histogram, but with a binwidth (width argument) of 5 units
  faithful %>% ggvis( ~waiting ) %>% layer_histograms(width = 5)


  # Transform the code below: just compute the bins instead of plotting a histogram
  faithful %>% compute_bin(~waiting, width = 5)

  # Combine the solution to the first challenge with layer_rects() to build a histogram
  faithful %>% compute_bin(~waiting, width = 5) %>% ggvis( ) %>% layer_rects(x = ~xmin_, x2 = ~xmax_, y = 0, y2 = ~count_)


  # Combine compute_density() with layer_lines() to make a density plot of the waiting variable.
faithful %>% compute_density(~waiting) %>% ggvis(~pred_, ~resp_) %>% layer_lines()

# Build a density plot directly using layer_densities. Use the correct variables and properties.

faithful %>% ggvis( ~waiting, fill := 'green') %>% layer_densities()


# Complete the code to plot a bar graph of the cyl factor.
mtcars %>% ggvis(~factor(cyl)) %>% layer_bars()

# Adapt the solution to the first challenge to just calculate the count values. No plotting!
mtcars %>% compute_count(~factor(cyl))


# Both ggvis and dplyr are loaded into the workspace

# Change the code to plot a unique smooth line for each value of the cyl variable.
mtcars %>% group_by(cyl) %>% ggvis(~mpg, ~wt, stroke = ~factor(cyl)) %>% layer_smooths()

# Adapt the graph to contain a separate density for each value of cyl.
mtcars %>% group_by(cyl) %>% ggvis(~mpg) %>% layer_densities()

# Copy and alter the solution to the second challenge to map the fill property to a categorical version of cyl.
mtcars %>% group_by(cyl) %>% ggvis(~mpg, fill = ~factor(cyl)) %>% layer_densities()


# Alter the graph below: separate density for each unique combination of 'cyl' and 'am'.
mtcars %>% group_by(cyl, am) %>% ggvis(~mpg, fill = ~factor(cyl)) %>% layer_densities()

# Update the graph below to map `fill` to the unique combinations of the grouping variables.
mtcars %>% group_by(cyl, am) %>% ggvis(~mpg, fill = ~interaction(cyl, am)) %>% layer_densities()

mtcars %>%
  group_by(am) %>%
  ggvis(~mpg, ~hp) %>%
  layer_smooths(stroke = ~factor(am)) %>%
  layer_points(fill = ~factor(am))


  mtcars %>%  ggvis(~factor(am,levels=c(0,1), labels=c('manual','automatic')),~mpg,
   fill := "green"
  ) %>%  layer_bars() %>%
    add_axis("x", title = "Transmission type")  %>%
    add_axis("x", orient = "top", ticks = 0, title = "Comparing mpg for manual and automatic",
           properties = axis_props(
             axis = list(stroke = "white"),
             labels = list(fontSize = 0)))


  # Run this code and inspect the output. Follow the link in the instructions for the interactive version
  faithful %>%
    ggvis(~waiting, ~eruptions, fillOpacity := 0.5,
          shape := input_select(label = "Choose shape:",
                                choices = c("circle", "square", "cross", "diamond",
                                            "triangle-up", "triangle-down"))) %>%
    layer_points()

  # Copy the first code chunk and alter the code to make the fill property interactive using a select box
  faithful %>%
    ggvis(~waiting, ~eruptions, fillOpacity := 0.5,
          shape := input_select(label = "Choose shape:",
                                choices = c("circle", "square", "cross",
                                            "diamond", "triangle-up", "triangle-down")),
          fill := input_select(label = "Choose color:",
                               choices = c("black", "red", "blue", "green"))) %>%
    layer_points()

  # Add radio buttons to control the fill of the plot
  mtcars %>%
    ggvis(~mpg, ~wt,
          fill := input_radiobuttons(label = "Choose color:",
                                     choices = c("black", "red", "blue", "green"))) %>%
      layer_points()

      # Change the radiobuttons widget to a text widget
      mtcars %>%
        ggvis(~mpg, ~wt,
              fill := input_text(label = "Choose color:",
                                         value= "black")) %>%
        layer_points()


      # Map the fill property to a select box that returns variable names
      mtcars %>%
        ggvis(~mpg, ~wt, fill = input_select(label ="Choose fill variable:", choices = names(mtcars), map = as.name) ) %>%
        layer_points()

        # Create a graph containing a scatterplot, a linear model and a smooth line.

        pressure %>% ggvis(~temperature, ~pressure)  %>% 
          layer_lines(opacity:=0.5) %>%
          layer_points() %>%
          layer_model_predictions(model = 'lm', stroke := "navy") %>%
          layer_smooths(stroke := 'skyblue')
