import React from 'react';
import Header from "./Header";

// Laout Component Is The Content That Will Be Displayed on Every Page
const Layout = ({ children }) => {
    return (
        <div>
            <Header />
            {
                // The Children prop will contain the content of the page
                // This is passed down from the pages where this layout is used (Home, News, Opinions, etc.)
                
            }
            <main>{children}</main>
        </div>
    );
};

export default Layout;