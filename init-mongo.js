// //create auth
// db = new Mongo().getDB("admin");

// db.createUser(
//     {
//         user: "grumpycat",
//         pwd: "alo123",
//         roles: [
//             {
//                 role: "readWrite",
//                 db: "blog_development"
//             }
//         ],
//         mechanisms:["SCRAM-SHA-1"]
//     }
// );


// db.createUser(
//     {
//         user: "root", 
//         pwd: "root", 
//         roles:["root"]
//     }
// );
// db = new Mongo().getDB("testDB");
// //MongoDB creates the database when you first store data in that database
// db.createCollection("test"); 
// db.test.insert([
//     { "item": 1 }
// ]); 