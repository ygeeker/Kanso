import * as React from "react";
import { Card, CardTitle, Typography } from "@kindle-ui/core";
import dic from "../../i18n.json";
import type { ISiteConfig } from "src/types";

const LinkItem = ({ title, url }) => (
	<>
		<a key={title} href={url}>
			{title}
		</a>
		&nbsp;
	</>
);

const RelatedLink = ({
	locale = "zh-CN",
	links = [],
}: {
	locale: string;
	links: Pick<ISiteConfig, "relatedLinks">;
}) => {
	return (
		<div className="P(10px)">
			<Card>
				<Typography>
					<CardTitle>{dic.RelatedLinks.title[locale]}</CardTitle>{" "}
					{links.map((item, i) => (
						<LinkItem {...item} />
					))}
					<a href="">{dic.RelatedLinks.submit[locale]}</a>
				</Typography>
			</Card>
		</div>
	);
};

export default RelatedLink;
