import React from "react";
import Link from "next/link";

// Header Component That Will Be Displayed On All Pages For Navigation
const Header = () => {
    return (
        <div>
            <nav>
                <div className="container">
                    <div>
                        <ul>
                            <li>
                                {
                                    // Link Component is What Creates Navigation in Header
                                    // href parameter needs to be the same as file name except Home, which is the default start page
                                }
                                <Link
                                    href="/"
                                >
                                    Paw Print
                                </Link>
                            </li>
                            <li>
                                <Link
                                    href="/news"
                                >
                                    News And Features
                                </Link>
                            </li>
                            <li>
                                <Link
                                    href="/opinions"
                                >
                                    Opinions
                                </Link>
                            </li>
                            <li>
                                <Link
                                    href="/vanguard"
                                >
                                    Vanguard
                                </Link>
                            </li>
                            <li>
                                <Link
                                    href="/arts"
                                >
                                    Arts and Entertainment
                                </Link>
                            </li>
                            <li>
                                <Link
                                    href="/sports"
                                >
                                    Sports
                                </Link>
                            </li>
                            <li>
                                <Link
                                    href="/social"
                                >
                                    Social
                                </Link>
                            </li>
                            <li>
                                <Link
                                    href="/archives"
                                >
                                    Archives
                                </Link>
                            </li>
                            <li>
                                <Link
                                    href="/about"
                                >
                                    About
                                </Link>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    );
};

export default Header;
