Install ImageMagick [link text][2]  
Install [Ruby ][2] 2.3  
Run bundle

## API ##

Create user
-------

**Request**

> POST /api/users

**Response**

> OK

Get resized image
-----------------

**Request**
> POST /api/images



*Request data*
```
{
  image: {
    picture: [file],
    width: [integer]
    height: [integer]
  }
}
```

**Success response**  

Server will return resized image


**Error (invalid request parameters)**  
*Example:*
```
{
  "errors":[
    {
      "field":"width",
      "message":"is not a number"
    },
    {
      "field":"height",
      "message":"is not a number"
    },
    {
      "field":"picture",
      "message":"can't be blank"
    }
  ]
}
```

Get list of uploaded images
-------

**Request**

> GET /api/images

**Response**
*Example:*
```
{  
  "images":[  
    {  
      "height":1111,
      "width":1522,
      "url":"http://127.0.0.1:3000/api/images/3"
    },
    {  
      "height":811,
      "width":1111,
      "url":"http://127.0.0.1:3000/api/images/2"
    },
    {  
      "height":811,
      "width":1111,
      "url":"http://127.0.0.1:3000/api/images/1"
    }
  ]
}
```

Download one of uploaded images
**Request**
> GET /api/images/:image_id

**Response**
Server will return image

  [1]: http://www.imagemagick.org/script/index.php
  [2]: https://www.ruby-lang.org/                