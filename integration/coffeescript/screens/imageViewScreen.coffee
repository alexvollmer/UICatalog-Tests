class ImageViewScreen extends Screen

  validate: ->
    assertWindow({
      navigationBar: { name: "Image View" },
      images: [ {} ] # assert that one image view exists
    })

    # Validate visual appearance of the screen
    # TODO: the images swap around so a single screen shot won't match
