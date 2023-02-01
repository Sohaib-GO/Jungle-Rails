describe("Add to cart", () => {
  it("should visit the home page", () => {
    cy.visit("http://0.0.0.0:3000");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 11 products on the page", () => {
    cy.get(".products article").should("have.length", 11);
  });

  it("clicks on a button and adds a product to the cart", () => {
    cy.visit("http://0.0.0.0:3000");
    cy.get("article").eq(3).find(".add-to-cart-button").click({ force: true });
  });

  it("Check the number of items in the shopping cart", () => {
    cy.get(" .shopping-cart").should("be.visible");
    cy.get(" .shopping-cart").should("include.text", "1");
  });
});
