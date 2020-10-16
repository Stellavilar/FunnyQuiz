import React from 'react';
import { Dropdown } from 'semantic-ui-react';
import { useHistory } from 'react-router-dom';

const BurgerButton = () => {
    const history = useHistory();

    const onClickCreate = () => {
        history.push('/createProfil');
    };
    const onClickConnect = () => {
        history.push('/connect');
    };
    return (
        <div className="burger-button">
            <Dropdown item text='' icon='bars'>
                <Dropdown.Menu>
                    <Dropdown.Item onClick={onClickCreate}>Créer un compte</Dropdown.Item>
                    <Dropdown.Item onClick={onClickConnect}>Connexion</Dropdown.Item>
                </Dropdown.Menu>
            </Dropdown>
        </div>
    );
};

export default BurgerButton;
