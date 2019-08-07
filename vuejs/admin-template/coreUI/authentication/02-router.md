# Router
1. Add:
````
// Views - WNY
const SignIn = () => import('@/views/wny/auth/Login')

{
  path: '/auth',
  redirect: '/auth/404',
  name: 'Auth',
  component: {
    render (c) { return c('router-view') }
  },
  children: [
    // {
    //   path: '404',
    //   name: 'Page404',
    //   component: Page404
    // },
    // {
    //   path: '500',
    //   name: 'Page500',
    //   component: Page500
    // },
    {
      path: 'sign-in',
      name: 'SignIn',
      component: SignIn
    },
    {
      path: 'register',
      name: 'Register',
      component: Register
    }
  ]
}
````
2. Test:
http://localhost:8082/#/auth/sign-in
