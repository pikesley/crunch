class Dashing.Length extends Dashing.Widget

  @accessor 'current', ->
    return @get('average') if @get('average')
    return @get('displayedValue') if @get('displayedValue')
    points = @get('points')
    value = @get('value')
    if points
      points[points.length - 1].y

  ready: ->
    color = '#ffffff'
    container = $(@node).parent()
    # Gross hacks. Let's fix this.
    width = (Dashing.widget_base_dimensions[0] * container.data("sizex")) + Dashing.widget_margins[0] * 2 * (container.data("sizex") - 1)
    height = (Dashing.widget_base_dimensions[1] * container.data("sizey"))
    max = @get('max')
    @graph = new Rickshaw.Graph(
      element: @node
      renderer: 'area'
      width: width
      height: height
      max: max
      series: [
        {
          color: color,
          data: [{x:0, y:0}]
        }
      ]
    )

    @graph.series[0].data = @get('points') if @get('points')

    x_axis = new Rickshaw.Graph.Axis.Time(graph: @graph, ticks: 3)
    y_axis = new Rickshaw.Graph.Axis.Y(graph: @graph, tickFormat: Rickshaw.Fixtures.Number.formatKMBT, ticks: 3)
    @graph.render()

  onData: (data) ->
    Dashing.debugMode = true
    if @graph
      @graph.series[0].data = data.points
      @graph.render()
