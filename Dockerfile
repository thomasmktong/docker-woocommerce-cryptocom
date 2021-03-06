FROM wordpress:latest

ENV WOOCOMMERCE_VERSION 5.1.0
ENV WOOCOMMERCE_UPSTREAM_VERSION 5.1.0

RUN apt-get update \
    && apt-get install -y --no-install-recommends unzip wget \
    && wget --no-check-certificate https://downloads.wordpress.org/plugin/woocommerce.5.1.0.zip -O /tmp/temp.zip \
    && cd /usr/src/wordpress/wp-content/plugins \
    && unzip /tmp/temp.zip \
    && rm /tmp/temp.zip \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y --no-install-recommends unzip wget \
    && wget --no-check-certificate https://downloads.wordpress.org/plugin/crypto-com-pay-checkout-for-woocommerce.1.3.0.zip -O /tmp/temp2.zip \
    && cd /usr/src/wordpress/wp-content/plugins \
    && unzip /tmp/temp2.zip \
    && rm /tmp/temp2.zip \
    && rm -rf /var/lib/apt/lists/*

COPY wp-sethost.sh /tmp/
COPY wp-cryptocom-sethost.sh /tmp/
