describe("Visit Product Details", () => {
  it("should visit the home page", () => {
    cy.visit("http://0.0.0.0:3000");
  });

  it("There is products on the page", () => {
    // 1
    cy.get(".products article").should("be.visible");
  });

  it("There is 11 products on the page", () => {
    // 2
    cy.get(".products article").should("have.length", 11);
  });

  it("clicks on a product and navigates to product detail page", () => {
    cy.get(".products article").first().click();
    cy.url().should("include", "/products/");
    cy.get(".product-detail").should("be.visible");
  });
});
