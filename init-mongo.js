//create auth
db.createUser(
    {
        user: "grumpycat",
        pwd: "alo123",
        roles: [
            {
                role: "readWrite",
                db: "blog_development"
            }
        ]
    }
);
//MongoDB creates the database when you first store data in that database
db.createCollection("test"); 