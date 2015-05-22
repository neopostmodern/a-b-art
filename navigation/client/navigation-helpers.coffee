Template.navigation.helpers(
  isActiveRoute: (routeName) -> Router.current().route.getName() is routeName
)