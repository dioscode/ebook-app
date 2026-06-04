<%-- Helper methods for CSS covers and genre badges — include once per page --%>
<%!
  static String coverClass(String genre, String cat) {
    if ("Old".equals(cat)) return "cover-old";
    if (genre == null) return "cover-general";
    String g = genre.toLowerCase().replace(" ","").replace("-","");
    if (g.contains("program") || g.contains("tech") || g.contains("java") || g.contains("code"))
        return "cover-programming";
    if (g.contains("fiction") || g.contains("novel") || g.contains("thriller") || g.contains("fantasy"))
        return "cover-fiction";
    if (g.contains("science") || g.contains("physics") || g.contains("biology"))
        return "cover-science";
    if (g.contains("history") || g.contains("histor"))
        return "cover-history";
    if (g.contains("self") || g.contains("motivat") || g.contains("psycho"))
        return "cover-selfhelp";
    if (g.contains("math") || g.contains("statistic") || g.contains("algebra"))
        return "cover-mathematics";
    return "cover-general";
  }

  static String genreBadgeClass(String genre) {
    if (genre == null) return "genre-general";
    String g = genre.toLowerCase().replace(" ","").replace("-","");
    if (g.contains("program") || g.contains("tech") || g.contains("code"))
        return "genre-programming";
    if (g.contains("fiction") || g.contains("novel") || g.contains("thriller"))
        return "genre-fiction";
    if (g.contains("science")) return "genre-science";
    if (g.contains("history")) return "genre-history";
    if (g.contains("self") || g.contains("motivat")) return "genre-selfhelp";
    if (g.contains("math"))    return "genre-mathematics";
    return "genre-general";
  }

  static String initial(String name) {
    if (name == null || name.isEmpty()) return "?";
    return String.valueOf(name.charAt(0)).toUpperCase();
  }
%>
