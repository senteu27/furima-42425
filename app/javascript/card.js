const pay = () => {
   const form = document.getElementById('charge-form');

  if (!form) {
    return;
  }
  const publickey = gon.public_key
  console.log("1");

const payjp = Payjp(publickey);

console.log("2");

const elements = payjp.elements();

console.log("3");

const numberElement = elements.create('cardNumber');

console.log("4");

const expiryElement = elements.create('cardExpiry');

console.log("5");

const cvcElement = elements.create('cardCvc');

console.log("6");

numberElement.mount('#number-form');

console.log("7");

expiryElement.mount('#expiry-form');

console.log("8");

cvcElement.mount('#cvc-form');

console.log("9");

  form.addEventListener("submit", (e) => {
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      document.getElementById("charge-form").submit();
    });
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);