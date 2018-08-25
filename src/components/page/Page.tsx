import * as React from "react";
import {StatelessComponent} from "react";
import "./Page.css";
import {classNames} from "../../utils/classNames";

export interface PageProps {
    className?: string;
    title?: string;
}

export const Page: StatelessComponent<PageProps> = ({children, className, title}) => {
    if (title) {
        document.title = title;
    }
    return (
        <div className={classNames("Page", className)}>
            {children}
        </div>
    );
};