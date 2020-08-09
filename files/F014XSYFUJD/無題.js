const foo = ({ product, storage, ingredient, ingredientSubscription }) => {
  const pProduct = (100 * product) / storage
  const pIngredient = (100 * ingredient) / storage
  const pIngredientSubscription = (100 * ingredientSubscription) / storage
  return bar({ pProduct, pIngredient, pIngredientSubscription })
}

const bar = ({ pProduct, pIngredient, pIngredientSubscription }) => (
  <div className="progress">
    <div
      className="progress-bar bg-primary"
      role="progressbar"
      style={{ width: `${pProduct}%` }}
      aria-valuemin="0"
      aria-valuemax="100"
      aria-valuenow={pProduct}
    >
      P
    </div>
    <div
      className="progress-bar bg-info"
      role="progressbar"
      style={{ width: `${pIngredient}%` }}
      aria-valuemin="0"
      aria-valuemax="100"
      aria-valuenow={pIngredient}
    >
      I
    </div>
    <div
      className="progress-bar bg-info"
      role="progressbar"
      style={{ width: `${pIngredientSubscription}%`, height: "2px" }}
      aria-valuemin="0"
      aria-valuemax="100"
      aria-valuenow={pIngredientSubscription}
    ></div>
  </div>
)
