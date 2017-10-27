package judgels.jophiel.api.user;

import static javax.ws.rs.core.MediaType.APPLICATION_JSON;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

@Path("/api/v2/users")
public interface UserService {
    @GET
    @Path("/{userJid}")
    @Produces(APPLICATION_JSON)
    User getUser(@PathParam("userJid") String userJid);

    @GET
    @Path("/id/{userId}")
    @Produces(APPLICATION_JSON)
    User getUserById(@PathParam("userId") long userJid);

    @POST
    @Path("/")
    @Consumes(APPLICATION_JSON)
    void createUser(User.Data userData);

    @PUT
    @Path("/{userJid}")
    @Consumes(APPLICATION_JSON)
    void updateUser(@PathParam("userJid") String userJid, User.Data userData);
}
