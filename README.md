## respoke-sample

* Start the app (you should use other port ```rails s -p 2345``` instead of default ```rails s```)
* Open web app and hit ``connect respoke``` button. You then can see error in console

#### What I created:
```home controller``` with actions:
* index -> root path is point to here
* remote_video -> remote url: localhost/remote_video
* get_respoke_token -> return respoke access token for respoke authentication
```ruby
def get_respoke_token
    client = Respoke::Client.new(
        app_secret: "04099d1e-8637-4a70-9ad7-da428bbf5574"
    )

    @respoke_token = client.app_token(
        appId: "7350fe8d-a87c-4899-af2a-7780b2a78b29",
        roleId: "C42A63C1-2EDC-404E-9171-434A0CB457F9",
        endpointId: params[:respoke][:endpointId],
        ttl: 10
    )

    respond_to do |format|
      # format.html
      format.json { render :json => { token: @respoke_token }, :status => :ok }
    end
  end
```
#### What I am stucked at:
* I get 401 unauthorized when trying to access Respoke

```javascript
// File: home/index.html.erb
$("#doLogin").click(function() {
        console.log("<%= @respoke_token %>");

        $.ajax({
            method: "POST",
            url: "/get_respoke_token.json",
            data: {
                respoke: { endpointId: endpointId }
            },
            success: function(response) {
                var token = response.token;

                client.connect({
                    token: token
                });
            }
        });

    });
```
