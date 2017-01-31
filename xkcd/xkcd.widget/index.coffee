
command: "curl --silent https://xkcd.com/info.0.json"

# Set the refresh frequency (milliseconds) to every 6 hours
refreshFrequency: 21600000

# Render the output.
render: (output) -> """
  <div id='container'>
  <div>
"""
update: (output, domEl) ->
  xkcd = JSON.parse(output)
  container = $(domEl).find('#container')
  content =
    """
    <h2>#{xkcd.title}</h2>
    <div class='alt'>#{xkcd.alt}</div>
    <img src="#{xkcd.img}"/>
    """
  $(container).html content

# CSS Style
style: """
  margin:0
  padding:0px
  left:325px
  top: 150px
  background:rgba(#000, .25)
  border-radius:10px
  background: rgb(255, 255, 255) transparent;
  background: rgba(255, 255, 255, 0.0);

  h2
    text-align:center
  .alt
    text-align:center
    margin:25px
  img
    margin:10px
"""
