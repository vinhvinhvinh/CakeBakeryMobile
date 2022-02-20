//android virtual host
const baseUrl = 'http://10.0.2.2:8000/api';

//img cloud in phpAdmin
const imgUrl = 'http://10.0.2.2/img/mobile/';

//Login Url
const loginUrl = 'http://10.0.2.2:8000/api/login';

//Resigter Url
const registerUrl = 'http://10.0.2.2:8000/api/register';

//Logout Url
const logoutUrl = 'http://10.0.2.2:8000/api/logout';

//path of Object
//Product
const productUrl = baseUrl + '/products';
const productSellingUrl = productUrl + '/bstSelling/all';
const productInCartUrl = productUrl + '/prodInCart';
const newProds = productUrl + '/newProduct/all';
//ProdctType
const productTypeUrl = baseUrl + '/product_types';

const accountUrl = '/accounts';

//Favorite
const favUrl = baseUrl + '/favorites';

const cmtUrl = baseUrl + '/comments';
//cart
const deleteCartRowUrl = baseUrl + '/carts/delete/';
const updateCartQtyUrl = baseUrl + '/carts/update/';

//pay
const payUrl = 'http://10.0.2.2:8000/api/invoices/create';
