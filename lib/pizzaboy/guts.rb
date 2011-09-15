PizzaBoy.guts do

  match /^dywj/i do
    say "DAMN YOU WILL JESSOP"
  end

  match /^\s*f+u+\s*$/i do
    say "http://caius.name/images/fu.jpg"
  end

  # ==================
  # = Debug triggers =
  # ==================
  match /^say (.+)$/ do
    say matches[0]
  end

  match /(.*)/ do
    puts "catchall triggered for #{matches[0]}"
  end

end
