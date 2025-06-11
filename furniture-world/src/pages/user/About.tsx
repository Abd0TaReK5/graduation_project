import React from 'react';
import { Flex, Row, Image, Typography, theme } from 'antd';
import { Banner } from '../../components/userComponents/banner';
import { assets } from '../../assets';
import { navBarHeight } from 'src/theme';

type Props = {};

const { Text } = Typography;

export const AboutPage = (props: Props) => {
    const { token } = theme.useToken();

    const members = [
        {
            middleName: 'Gia',
            firstName: 'Bao',
            image: assets.GiaBao,
        },
        {
            middleName: 'Cong',
            firstName: 'Bang',
            image: assets.CongBang,
        },
        {
            middleName: 'Minh',
            firstName: 'Vu',
            image: assets.MinhVu,
        },
        {
            middleName: 'Minh',
            firstName: 'Huy',
            image: assets.MinhHuy,
        },
    ];

    return (
        <Flex style={{ flexDirection: 'column', alignItems: 'center', width: '100vw', paddingTop: `${navBarHeight}` }}>
            <Banner title="About" />
            <Flex style={{ flexDirection: 'column', gap: '60px', width: '100%', marginTop: '50px' }}>
                <Flex style={{ justifyContent: 'space-between', alignItems: 'center', padding: '0 100px' }}>
                    <Image src={assets.company} preview={false} style={{ width: '600px', borderRadius: '10px' }} />
                    <Flex style={{ flexDirection: 'column', gap: '20px', width: '50%' }}>
                        <Text style={{ fontSize: '24px', fontWeight: '500' }}>About Heavenly Touch</Text>
                        <Text style={{ fontSize: '18px', fontWeight: '400', textAlign: 'justify' }}>
                            Welcome to Heavenly Touch, Our project focuses on
                            creating a user
                            -friendly
                            furniture website that
                            simplifies the process of
                            exploring, comparing, and
                            purchasing furniture online.
                            The platform will showcase
                            modern designs, custom
                            options, and a seamless
                            shopping experience, making it
                            easier for customers to furnish
                            their homes or offices.
                        </Text>
                    </Flex>
                </Flex>
                <Flex style={{ justifyContent: 'space-between', alignItems: 'center', padding: '0 100px' }}>
                    <Flex style={{ flexDirection: 'column', gap: '20px', width: '45%' }}>
                        <Text style={{ fontSize: '24px', fontWeight: '500' }}>Our Products and Services</Text>
                        <Text style={{ fontSize: '18px', fontWeight: '400', textAlign: 'justify' }}>
                            Heavenly Touch boosts a diverse selection of furniture that encompasses everything needed to
                            furnish a home or office, from plush sofas and ergonomic office chairs to luxurious beds and
                            stylish dining sets. Each product is designed with the utmost attention to aesthetics and
                            practical functionality. Beyond just selling furniture, we offer comprehensive interior
                            design services that guide customers through the process of envisioning and realizing the
                            layout and decoration of their spaces. Our team works closely with clients to ensure their
                            decor reflects their personal style and meets their functional needs.
                        </Text>
                    </Flex>
                    <Flex style={{ gap: '20px' }}>
                        <Image
                            src={assets.image14}
                            preview={{ mask: null }}
                            style={{ width: '200px', borderRadius: '10px' }}
                        />
                        <Image
                            src={assets.image12}
                            preview={{ mask: null }}
                            style={{ width: '200px', borderRadius: '10px' }}
                        />
                        <Image
                            src={assets.image16}
                            preview={{ mask: null }}
                            style={{ width: '200px', borderRadius: '10px' }}
                        />
                    </Flex>
                </Flex>
                <Flex style={{ justifyContent: 'space-between', alignItems: 'center', padding: '0 100px' }}>
                    <Image
                        src={assets.commitment}
                        preview={false}
                        style={{ width: '600px', height: '350px', borderRadius: '10px' }}
                    />
                    <Flex style={{ flexDirection: 'column', gap: '20px', width: '50%' }}>
                        <Text style={{ fontSize: '24px', fontWeight: '500' }}>
                            Commitment to Quality and Sustainability
                        </Text>
                        <Text style={{ fontSize: '18px', fontWeight: '400', textAlign: 'justify' }}>
                            Sustainability is at the core of our manufacturing processes at Heavenly Touch. We are dedicated
                            to reducing our environmental footprint by utilizing responsibly sourced materials and
                            implementing eco-friendly manufacturing techniques. Our commitment extends beyond the
                            materials we use to the methods of our craftsmanship, ensuring that every piece of furniture
                            is not only durable and safe but also environmentally conscious. We engage in continuous
                            dialogue with sustainability experts to improve our practices and contribute positively to
                            the global community. By choosing Heavenly Touch, customers not only invest in superior quality
                            furniture but also support sustainable practices that benefit the environment.
                        </Text>
                    </Flex>
                </Flex>
                
            </Flex>
        </Flex>
    );
};
