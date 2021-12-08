import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../Login.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  { path: '/loginwithtoken', name: 'loginwithtoken', component: Login },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

router.afterEach(to => {
  let pageName = to.path
  if (to.matched && to.matched.length > 0 && to.matched[0].path) {
    pageName = to.matched[0].path
  }

  // eslint-disable-next-line no-console
  console.log('Set page to', pageName)

  // eslint-disable-next-line no-undef
  ineum('page', pageName)
})

export default router
