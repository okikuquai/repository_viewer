//実行するクエリ
String readRepositories = """
      query ReadRepositories(\$nRepositories: Int!) {
        viewer {
          repositories(last: \$nRepositories) {
            nodes {
              id
              name
              description
            }
          }
        }
      }
    """;
String readOrgRepositories = """
query ReadOrgRepositories(\$orgName: String!){
  organization(login: \$orgName){
    name,
    login,
    teams(first: 100){
      totalCount,
      edges{
        node{
          name,
          description,
          repositories(first: 100){
            totalCount,
            edges{
              node{
                name,
                description,
                url,
              }
            }
          }
        }
      }
    }
  }
}
    """;
// String readOrgRepositories = """
// query ReadOrgRepositories(\$orgName: String!){
//   organization(login: \$orgName){
//     name,
//     login,
//     teams(first: 100){
//       totalCount,
//       edges{
//         node{
//           name,
//           description,
//           repositories(first: 100){
//             totalCount,
//             edges{
//               node{
//                 nameWithOwner
//               }
//             }
//           }
//         }
//       }
//     }
//   }
// }
//     """;