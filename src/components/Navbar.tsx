import * as React from "react";
import {NavLink} from "react-router-dom";
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faEnvelope} from "@fortawesome/free-regular-svg-icons";
import {HiddenLink} from "./HiddenLink";
import {classNames} from "../utils/classNames";

interface NavbarState {
    menuActive: boolean;
}

export class Navbar extends React.Component<{}, NavbarState> {
    public state = {
        menuActive: false
    };

    private toggleMenu = () => {
        this.setState({menuActive: !this.state.menuActive});
    };

    public render() {
        const {menuActive} = this.state;
        return (
            <nav className="navbar">
                <div className="container">
                    <div className="navbar-brand">
                        <NavLink className="navbar-item"
                                 to="/"
                                 exact={true}
                                 activeClassName="is-active">
                            Home
                        </NavLink>
                        <a className={classNames("navbar-burger", {"is-active": menuActive})}
                           onClick={this.toggleMenu}>
                            <span/>
                            <span/>
                            <span/>
                        </a>
                    </div>
                    <div className={classNames("navbar-menu", {"is-active": menuActive})}>
                        <div className="navbar-start">
                            <NavLink className="navbar-item"
                                     to="/portfolio"
                                     activeClassName="is-active">
                                Portfolio
                            </NavLink>
                            <NavLink className="navbar-item"
                                     to="/resume"
                                     activeClassName="is-active">
                                Resume
                            </NavLink>
                        </div>
                        <div className="navbar-end">
                            <div className="navbar-item">
                                <HiddenLink className="button"
                                            href="bWFpbHRvOmphY29iQGphY29iLXN3YW5zb24uY29t"
                                            decode={true}>
                                    <span className="icon">
                                        <FontAwesomeIcon icon={faEnvelope}/>
                                    </span>
                                    <span>Say Hello</span>
                                </HiddenLink>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
        );
    }
}