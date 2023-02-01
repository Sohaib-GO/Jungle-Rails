// Write a basic test to visit the home page of our Jungle App.

describe("Home Page", () => {
  it("should visit the home page", () => {
    cy.visit("http://0.0.0.0:3000");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  
  it("There is 11 products on the page", () => {
    cy.get(".products article").should("have.length", 11);
  });
  
});
