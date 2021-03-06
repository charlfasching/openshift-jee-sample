package za.co.charl.rest;



import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;


@Path("/test")
@Produces(MediaType.APPLICATION_JSON)
public class TestService {

    
    
    @GET
    @Path("/")
    public Response hello() {
        return Response.ok("what?").build();
    }

    @GET
    @Path("/list")
    public Response list() {
        List<String> atrs = Arrays.asList("Item1","Item2");
        return Response.ok(atrs).build();
    }
    
    @POST
    @Path("/save")
    public Response save() {
        return Response.ok("Saved").build();
    }

    @GET
    @Path("/who")
    public Response test() {
        
        Optional<String> hostName = Optional.ofNullable(System.getenv("HOSTNAME"));
        return Response.ok(hostName.orElse("Unknown")).build();
    }
    
    

  
}
