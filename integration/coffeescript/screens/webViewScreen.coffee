class WebViewScreen extends Screen

  validate: ->
    assertWindow({
      navigationBar: { name: "Web View" },
      textFields: [
        { value: 'http://apple.com' }
      ],
      scrollViews: [
        {
          webViews: [ {} ],
          images: [ {}, {} ]
        }
      ]
    })

    # Content is dynamically loaded from the web so a
    # screenshot comparison would fail as soon as the
    # website's content changes

