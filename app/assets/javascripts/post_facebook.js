  function postFacebook(link, picture, caption, description) {    
    caption = decodeURI(caption);
    description = decodeURI(description);
    caption = caption.replace("&#39;","'");
    caption = caption.replace("&#34;",'"');
    description = description.replace("&#39;","'");
    description = description.replace('&#34;','"');
    FB.getLoginStatus(function(response) {
      if(response.status === 'connected') {
        FB.ui({
            method : 'feed',
            name : 'GreenThumb',
            link : link,
            picture : picture,
            caption : caption,
            description : description
        }, function(response) {
            if(response && response.post_id) {
                alert('Post was published.');
            }
        });
      } else {
        FB.login(function(response) {
            if(response.authResponse) {
                responseAuth = response.authResponse;
                FB.api('/me', function(person) {
                    status = doAthenticationFb(responseAuth, person);
                    FB.ui({
                        method : 'feed',
                        name : 'GreenThumb',
                        link : link,
                        picture : picture,
                        caption : caption,
                        description : description
                    }, function(response) {
                        if(response && response.post_id) {
                            alert('Post was published.');
                        }
                    });
                });
            } else {
            }
        }, {
            scope : 'email'
        });
      }
    });
  }