
command: "curl --silent https://xkcd.com/info.0.json"

# Set the refresh frequency (milliseconds) to every 6 hours
refreshFrequency: 21600000

# CSS Style
style: """
  font-family: Helvetica Neue
  padding:0px
  top: 8%
  left: 22.5%
  background:rgba(#000, .25)
  
  background: rgb(255, 255, 255) transparent;
  background: rgba(255, 255, 255, 0.0);
 
  #container
    width:800px
  h2
    text-align:center;
    color:#ddd
  .alt
    width: 600px;
    margin-left: auto;
    margin-right: auto;
    text-align:justify;
    color:#ddd;
    margin-bottom:10px;
  img
    display: block;
    margin-left: auto;
    margin-right: auto;
    height:500px
"""

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
    <h2>##{xkcd.num} - #{xkcd.title}</h2>
    <div class='alt'>#{xkcd.alt}</div>
    <img src="#{xkcd.link}"/>
    """
  $(container).html content


