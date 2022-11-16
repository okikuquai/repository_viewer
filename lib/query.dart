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