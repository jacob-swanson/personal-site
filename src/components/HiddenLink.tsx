import * as React from "react";

export interface HiddenLinkProps {
    className?: string;
    href?: string;
    decode?: boolean;
}

interface HiddenLinkState {
    showLink?: boolean;
}

export class HiddenLink extends React.Component<HiddenLinkProps, HiddenLinkState> {
    public state = {
        showLink: false
    };

    private onMouseEnter = () => {
        this.setState({showLink: true});
    };

    public render() {
        const {className, children} = this.props;
        const href = this.getHref();
        return (
            <a
                className={className}
                onMouseEnter={this.onMouseEnter}
                href={href}
            >
                {children}
            </a>
        );
    }

    private getHref(): string | undefined {
        const {showLink} = this.state;
        if (!showLink) {
            return undefined;
        }

        const {decode, href} = this.props;
        if (!href) {
            return undefined;
        }

        return decode ? atob(href) : href;
    }
}